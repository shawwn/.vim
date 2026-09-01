# .vim

Vim configuration, kept as a git repo checked out at `~/.vim` with the rc files
symlinked into `$HOME`.

| Path | What |
|---|---|
| `.vimrc` | main config; symlinked to `~/.vimrc` |
| `.ideavimrc` | IdeaVim (JetBrains) config; symlinked to `~/.ideavimrc` |
| `ftdetect/`, `ftplugin/`, `syntax/` | filetype support for Arc and Lumen |
| `shell/gvim.sh` | shell wrapper so `gvim <file>` focuses an existing window instead of duplicating it |
| `bundle/` | Vundle-installed plugins — **not tracked** (see `.gitignore`) |

---

## First-time setup

### 1. Install the editor

**macOS — MacVim:**

```bash
brew install --cask macvim
```

**Linux (Ubuntu/Debian) — gvim, plus the dependencies `shell/gvim.sh` needs:**

```bash
sudo apt install vim-gtk3 wmctrl
```

- `vim-gtk3` provides `gvim` built with `+clientserver`, which the shell wrapper
  requires. Stock `vim` on Ubuntu is terminal-only.
- `wmctrl` gives a focused window real keyboard/mouse focus. Without it the
  window is only raised to the front and you still have to click it.

Verify:

```bash
gvim --version | grep clientserver     # want: +clientserver
```

See the header of `shell/gvim.sh` for the full dependency rationale.

### 2. Clone the repo to `~/.vim`

```bash
git clone https://github.com/shawwn/.vim.git ~/.vim
```

If `~/.vim` already exists, move it aside first (`mv ~/.vim ~/.vim.old`).

### 3. Symlink the rc files

```bash
ln -s .vim/.vimrc     ~/.vimrc
ln -s .vim/.ideavimrc ~/.ideavimrc
```

The targets are relative on purpose, so `$HOME` can move without breaking them.
If you already have real files there, back them up first:

```bash
mv ~/.vimrc ~/.vimrc.bak      # only if it exists and is not already a symlink
```

Check:

```bash
ls -l ~/.vimrc ~/.ideavimrc   # both should point into .vim/
```

### 4. Install Vundle and the plugins

`.vimrc` manages 23 plugins with Vundle, which has to be cloned by hand once —
nothing else will load until it exists:

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```

If `vim +PluginInstall +qall` appears to hang, it is waiting on a terminal it
does not have. Give it a pty:

```bash
script -qec "vim +PluginInstall +qall" /dev/null
```

Verify — vim should start with no errors, and:

```bash
ls ~/.vim/bundle/ | wc -l     # want: 23  (Vundle is one of the 23 Plugin lines)
```

Without this step every `Plugin` line in `.vimrc` fails with
`E492: Not an editor command`, plus `E185: Cannot find color scheme 'solarized'`.

### 5. Shell integration (Linux)

Source the `gvim` wrapper from your shell rc. The same line works in bash and
zsh:

```bash
echo '[ -f ~/.vim/shell/gvim.sh ] && . ~/.vim/shell/gvim.sh' >> ~/.bashrc
echo '[ -f ~/.vim/shell/gvim.sh ] && . ~/.vim/shell/gvim.sh' >> ~/.zshrc
```

If you keep a single shared rc that both shells source (e.g. `~/.shrc`), put the
line there once instead:

```bash
# in ~/.shrc
[ -f ~/.vim/shell/gvim.sh ] && . ~/.vim/shell/gvim.sh

# and in BOTH ~/.bashrc and ~/.zshrc
[ -f ~/.shrc ] && . ~/.shrc
```

Apply it to the current shell and confirm:

```bash
. ~/.vim/shell/gvim.sh
type gvim        # want: "gvim is a function"
```

### 6. Verify the whole thing

```bash
vim +q                        # starts clean, no errors
ls -l ~/.vimrc                # symlink into .vim/
ls ~/.vim/bundle/ | wc -l     # 23
type gvim                     # a function, not just /usr/bin/gvim
```

---

## Notes

- **Solarized loads in any GUI vim.** `.vimrc` guards it with
  `has('gui_running')`, so MacVim and Linux gvim both get it while terminal
  vim falls back to the default scheme. The `colorscheme` call is `silent!`,
  so a missing solarized degrades quietly instead of erroring.
- **`bundle/` is gitignored.** Plugins are reinstalled with `:PluginInstall`
  rather than vendored; do not commit them.
- **minibufexpl is installed**, so a second buffer in one window opens a
  horizontal buffer-list split. `shell/gvim.sh` avoids this by giving each new
  file its own window.
- **IdeaVim** reads `~/.ideavimrc`; JetBrains IDEs pick it up automatically once
  the symlink exists.
