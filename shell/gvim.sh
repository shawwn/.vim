# gvim.sh -- shell wrapper making `gvim` behave like a proper GUI editor:
# reopening a file that is already open focuses that window instead of
# spawning a duplicate or splitting the current one.
#
#   gvim foo.txt   -- already open somewhere? focus that window.
#                     otherwise open a BRAND NEW window.
#   gvim           -- plain gvim, no remote logic.
#
# DEPENDENCIES -- install these FIRST, this file does nothing without them
#
#     sudo apt install vim-gtk3 wmctrl
#
#   vim-gtk3   REQUIRED. Provides the gvim binary (as /usr/bin/vim.gtk3, wired
#              to /usr/bin/gvim via update-alternatives) built with
#              +clientserver, which is what --serverlist / --remote-silent /
#              --remote-expr need. Stock `vim` on Ubuntu is terminal-only and
#              has no gvim at all.
#              Check:  gvim --version | grep clientserver     -> +clientserver
#              Without it: `gvim: command not found`, or the remote calls fail
#              and every invocation opens a duplicate window.
#
#   wmctrl     STRONGLY RECOMMENDED (the function degrades gracefully if it is
#              missing, so it is not a hard requirement). Used to hand the
#              focused window real keyboard/mouse focus.
#              Check:  command -v wmctrl
#              Without it: the window is raised to the front but you still have
#              to click it before you can type -- see note 4 below.
#
#   Already present on any normal Linux install (no action needed):
#     coreutils  -- provides `realpath` and `timeout`, both used below.
#
#   Optional, only if you want to debug focus behaviour yourself:
#     sudo apt install x11-utils     # gives xprop, to read _NET_ACTIVE_WINDOW
#
# SETUP
#   This file is POSIX sh, so the same line works in bash and zsh.
#   Add it to whichever rc file(s) you use:
#
#       echo '[ -f ~/.vim/shell/gvim.sh ] && . ~/.vim/shell/gvim.sh' >> ~/.bashrc
#       echo '[ -f ~/.vim/shell/gvim.sh ] && . ~/.vim/shell/gvim.sh' >> ~/.zshrc
#
#   If you keep a single shared rc sourced by both (recommended), put the line
#   there once instead:
#
#       # in ~/.shrc
#       [ -f ~/.vim/shell/gvim.sh ] && . ~/.vim/shell/gvim.sh
#
#       # and in BOTH ~/.bashrc and ~/.zshrc
#       [ -f ~/.shrc ] && . ~/.shrc
#
#   The `[ -f ... ]` guard keeps your rc working on machines where this repo
#   is not checked out. Apply to the current shell without opening a new one:
#
#       . ~/.vim/shell/gvim.sh
#
#   Verify it loaded (should say "gvim is a function" / "shell function"):
#
#       type gvim
#
#   Packages needed: see DEPENDENCIES above (sudo apt install vim-gtk3 wmctrl).
#
#   X11 vs Wayland: wmctrl only works under X11, so the focus step is a no-op
#   on a Wayland session. Everything else still works. Check with:
#
#       echo $XDG_SESSION_TYPE          # want: x11
#
# WHY EACH PIECE IS THERE (all four were real bugs, not theory):
#
#   1. $GV holds the resolved gvim BINARY. `timeout` and `setsid` exec a real
#      program and cannot run the `command` shell builtin, so
#      `timeout 3 command gvim ...` fails with "failed to run command 'command'"
#      and returns nothing -- every server probe silently comes back empty and
#      you always get a new window.
#
#   2. No `--` on the --remote-silent call. vim's --remote-* options do NOT
#      treat `--` as an end-of-options marker; it is taken as a literal
#      filename, creating a stray buffer named "--". (Plain `gvim -- file` is
#      fine, which is why only the focus path was affected.)
#
#   3. Every probe is wrapped in `timeout`. A gvim that dies uncleanly can
#      leave its name in --serverlist; probing that dead server blocks
#      forever and would hang your shell prompt.
#
#   4. foreground() only RAISES the window. GNOME/mutter focus-stealing
#      prevention (focus-new-windows='smart') withholds input focus from a
#      gtk_window_present() that carries no user-interaction timestamp.
#      `wmctrl -i -a` sets _NET_ACTIVE_WINDOW with proper source indication,
#      which mutter does honour.
#
# NOTE: matching is per-file. `gvim a.txt b.txt` with only a.txt open will
# focus a.txt's window AND open a new window for b.txt.

gvim() {
  local GV; GV=$(command -v gvim) || return 1
  [ $# -eq 0 ] && { "$GV"; return; }

  local f abs srv found wid
  for f in "$@"; do
    abs=$(realpath -m -- "$f" 2>/dev/null || printf '%s' "$f")
    found=""

    for srv in $(timeout 3 "$GV" --serverlist 2>/dev/null); do
      if [ "$(timeout 3 "$GV" --servername "$srv" --remote-expr \
                "bufexists('$abs')" 2>/dev/null)" = "1" ]; then
        found=$srv
        break
      fi
    done

    if [ -n "$found" ]; then
      timeout 5 "$GV" --servername "$found" --remote-silent "$abs"
      timeout 3 "$GV" --servername "$found" --remote-expr 'foreground()' >/dev/null 2>&1
      if command -v wmctrl >/dev/null 2>&1; then
        wid=$(timeout 3 "$GV" --servername "$found" --remote-expr 'printf("0x%x", v:windowid)' 2>/dev/null)
        [ -n "$wid" ] && [ "$wid" != "0x0" ] && wmctrl -i -a "$wid" 2>/dev/null
      fi
    else
      ( setsid "$GV" -- "$abs" >/dev/null 2>&1 & )
    fi
  done
}
