set nocompatible
filetype indent plugin on
syntax on

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" turn autocommenting off for all filetypes.
"------------------------------------------------------
au FileType * setl fo-=cro
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" configure tabs.
"------------------------------------------------------
" Tabs are four columns wide, and each indentation level is one tab.
" (Popular with Windows developers using Visual Studio.)
"set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au FileType python setlocal expandtab tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType cpp setlocal expandtab tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType c setlocal expandtab tabstop=8 expandtab shiftwidth=2 softtabstop=2
"au FileType lumen setlocal tabstop=2 noexpandtab shiftwidth=8 softtabstop=8
au FileType swift setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType javascript setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType javascript setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType scss setlocal tabstop=2 noexpandtab shiftwidth=2 softtabstop=2
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" save newlines as \n rather than \r\n
"------------------------------------------------------
" set ff=unix
" set fileformats=unix
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" configure search.
"------------------------------------------------------
" highlight, and search incrementally as we type.
set hlsearch
set incsearch
" ignore case for the purposes of searching;  however if we 
" use an uppercase character, then treat it as case-sensitive.
set smartcase
set ignorecase
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" make backspace behave reasonably.
"------------------------------------------------------
set backspace=2
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" show line numbers, and set the width to be constant up to 99,999 lines.
"------------------------------------------------------
set number
set numberwidth=7
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" show the cursor position in the lower right as:  y,x
"------------------------------------------------------
set ruler
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" disable error bell.
"------------------------------------------------------
set visualbell
set vb t_vb=
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" set backup directory / options.
"------------------------------------------------------
"set backupdir=~/.vim/backup//
"set nobackup
"set nowritebackup
" For Unix and Win32, if a directory ends in two path separators '//'
" or '\\', the swap file name will be built from the complete path to
" the file with all path separators substituted to percent '%' signs.
" This will ensure file name uniqueness in the preserve directory.
" On Win32, when a separating comma is following, you must use '//',
" since '\\' will include the comma in the file name.
"set dir=$TEMP//
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" set plugin directory / backup directory / backup options.
"------------------------------------------------------
set runtimepath=~/.vim,$VIMRUNTIME
"silent execute '!mkdir "'.$VIMRUNTIME.'/backupfiles"'
"silent execute '!del "'.$VIMRUNTIME.'/backupfiles/*~"'

"set backupdir=~/.vim/backupfiles//
"set directory=~/.vim/backupfiles//

" disable backups
set nobackup

"nowritebackup changes the default "save" behavior of Vim, which is:
" 1. write buffer to new file
" 2. delete the original file
" 3. rename the new file
set nowritebackup

" save swap files and backup files to a secure place
set backupdir=/Volumes/MiscX/.vim/backupfiles//
set directory=/Volumes/MiscX/.vim/swpfiles//

" try disabling swapfiles
set noswapfile
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" turn cursor blinking off.
"------------------------------------------------------
set gcr=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor-blinkon0,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" set default window size.
"------------------------------------------------------
if has("gui_running")
  " GUI is running or is about to start.

  " Maximize gvim window.
  set lines=70
  set columns=200
else
  " This is console Vim.
  
  "if exists("+lines")
    "set lines=100
  "endif
  "if exists("+columns")
    "set columns=100
  "endif
endif
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" delete without yanking
"------------------------------------------------------
" delete without yanking
"nnoremap <leader>d "_d
"vnoremap <leader>d "_d

" replace currently selected text with default register
" without yanking it
"vnoremap <leader>p "_dP


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" delete without yanking - Attempt #2
"------------------------------------------------------
"noremap  y "*y
"noremap  Y "*Y

"noremap  p "*p
"noremap  P "*P

"noremap  d "*d
"noremap  D "*D

"vnoremap y "*y
"vnoremap Y "*Y

"vnoremap p "*p
"vnoremap P "*P

"vnoremap d "*d
"vnoremap D "*D
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" applescript files
"------------------------------------------------------
set runtimepath+=~/.vim/bundle/applescript.vim
"------------------------------------------------------

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" .swift files
"------------------------------------------------------
set runtimepath+=~/.vim/bundle/swift.vim
"------------------------------------------------------

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" .m files are Mathematica files, not Matlab files
"------------------------------------------------------
let filetype_m="mma"
"------------------------------------------------------

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" .arc files are Lisp files
"------------------------------------------------------
let g:arc_rainbow = 1
let g:arc_bodops = 1
let g:arc_highlight_lispwords = 1
let g:arc_highlight_lispwords = 1
let g:arc_detect_atstrings = 1
let g:arc_always_atstrings = 1
au BufRead,BufNewFile *.arc setf arc 
"------------------------------------------------------

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" .elf files are Lisp files
"------------------------------------------------------
let g:elf_rainbow = 1
let g:elf_bodops = 1
let g:elf_highlight_lispwords = 1
" au BufRead,BufNewFile *.elf setf elf 
" au BufRead,BufNewFile *.e setf elf 
" au BufRead,BufNewFile *.e setf arc 
let filetype_e="elf"
au BufRead,BufNewFile *.elf setf elf 
au BufRead,BufNewFile *.e setf elf 
au BufRead,BufNewFile *.js.e setf elf 
au BufRead,BufNewFile *.lua.e setf elf 
"------------------------------------------------------

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" .l files are Lumen Lisp files
"------------------------------------------------------
" au BufNewFile,BufRead *.lex,*.lxx	setf lex
au BufRead,BufNewFile *.l setf lumen 
" au FileType l setf lumen
let g:lumen_rainbow = 1
let g:lumen_bodops = 1
let g:lumen_highlight_lispwords = 1
"let g:lumen_detect_atstrings = 1
"let g:lumen_always_atstrings = 1
"------------------------------------------------------

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" .ls files are LemunScript Lisp files
"------------------------------------------------------
" au BufNewFile,BufRead *.lex,*.lxx	setf lex
au BufRead,BufNewFile *.ls setf lemun 
" au FileType l setf lemun
let g:lemun_rainbow = 1
let g:lemun_bodops = 1
let g:lemun_highlight_lispwords = 1
"------------------------------------------------------

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" .go files are Go files
"------------------------------------------------------
au BufRead,BufNewFile *.go setf go 
"------------------------------------------------------


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Vundle plugin manager.
" Setup instructions:
"  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"  open macvim, then run :PluginInstall!
"------------------------------------------------------
filetype off " required

"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

"Plugin 'mitechie/pyflakes-pathogen'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'altercation/vim-colors-solarized'
Plugin 'digitaltoad/vim-jade'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'fs111/pydoc.vim'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'vim-scripts/The-NERD-tree'
Plugin 'kchmck/vim-coffee-script'
Plugin 'rking/ag.vim'
Plugin 'tshirtman/vim-cython'
Plugin 'derekwyatt/vim-scala'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'leafgarland/typescript-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'guns/vim-clojure-static'
"Plugin 'davidhalter/jedi-vim'

Plugin 'posva/vim-vue'
Plugin 'digitaltoad/vim-pug'



" Plugin 'sbdchd/neoformat'
" Plugin 'pangloss/vim-javascript'
" Plugin 'mxw/vim-jsx'
" Plugin 'valloric/MatchTagAlways'
" Plugin 'epilande/vim-es2015-snippets'
" " ES2015 code snippets
" " Plugin 'epilande/vim-es2015-snippets'

" " React code snippets (Optional)
" Plugin 'epilande/vim-react-snippets'

" Plugin 'neomake/neomake'
" " " When writing a buffer.
" " call neomake#configure#automake('w')
" " " When writing a buffer, and on normal mode changes (after 750ms).
" " call neomake#configure#automake('nw', 750)
" " " When reading a buffer (after 1s), and when writing.
" " call neomake#configure#automake('rw', 1000)

" " Ultisnips
" Plugin 'SirVer/ultisnips'

" " Trigger configuration (Optional)
" let g:UltiSnipsExpandTrigger="<C-l>"

" let g:mta_filetypes = {
"       \ 'javascript.jsx' : 1,
"       \}

" let g:jsx_ext_required = 0


" Plugin 'tpope/vim-projectionist'
" Plugin 'prettier/prettier'
" " Plugin 'sbdchd/neoformat'

Plugin 'jdonaldson/vaxe'

Plugin 'udalov/kotlin-vim'

Plugin 'editorconfig/editorconfig-vim'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" set a dark background scheme.
"------------------------------------------------------
set background=dark
let g:solarized_italic=0
let g:solarized_contrast="high"
colorscheme solarized
"------------------------------------------------------


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" actually, set a light background scheme because my M1 Air can't seem
" to emit more than 1 lumen.
"------------------------------------------------------
set background=light
colorscheme morning
"------------------------------------------------------


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" enable indent guides on startup.
"------------------------------------------------------
"let g:indent_guides_enable_on_vim_startup = 1
"------------------------------------------------------

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" No automatic wrapping, rewrapping will wrap to 70 chars.
" Use gq to rewrap selected text.
" Use vip or vap to select an entire paragraph.
"------------------------------------------------------
set tw=70
set fo=cq
set wm=0
"------------------------------------------------------

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Break long lines by word, not by character.
"------------------------------------------------------
set lbr
"------------------------------------------------------

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" auto indent.
"------------------------------------------------------
set ai
"------------------------------------------------------

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" vertically center search results.
"------------------------------------------------------
"set scrolloff=999
"------------------------------------------------------

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" function to sum numbers.
" from http://vim.wikia.com/wiki/Sum_numbers 
"
" You can add the numbers with these commands:
"
"  :let g:S=0
"  :%s/\d\+/\=Sum(submatch(0))/
"  :echo g:S
"
"------------------------------------------------------
let g:S = 0  "result in global variable S
function! Sum(number)
  let g:S = g:S + a:number
  return a:number
endfunction
"------------------------------------------------------

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Unicode support.
"------------------------------------------------------
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif
"------------------------------------------------------

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" If a text file doesn't end with a newline, don't 
" automatically add it when we save the file.
"------------------------------------------------------
let g:PreserveNoEOL = 1
"------------------------------------------------------

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" minimal history and disable viminfo.
"------------------------------------------------------
set history=20
set viminfo=

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ConqueTerm.
"------------------------------------------------------
function! MyConqueStartup(term)

    " " set buffer syntax using the name of the program currently running
    " let syntax_associations = { 'ipython': 'python', 'irb': 'ruby' }

    " if has_key(syntax_associations, a:term.program_name)
    "     execute 'setlocal syntax=' . syntax_associations[a:term.program_name]
    " else
    "     execute 'setlocal syntax=' . a:term.program_name
    " endif

    " " shrink window height to 10 rows
    " resize 10

    " silly example of terminal api usage
    if a:term.program_name == 'bash'
        call a:term.writeln('. ~/.bash_profile')
        call a:term.writeln('"${CONQUE_CMD:-}"')
    endif
    
endfunction

"call conque_term#register_function('after_startup', 'MyConqueStartup')

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" YouCompleteMe
"------------------------------------------------------
" let g:ycm_min_num_identifier_candidate_chars = 2

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" jedi-vim
"------------------------------------------------------

"let g:jedi#show_call_signatures = "1"
"let g:jedi#use_splits_not_buffers = "left"


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" https://stackoverflow.com/questions/1483796/get-offset-of-current-buffer-in-vim-in-particular-via-python-scripting
"------------------------------------------------------
set statusline=%o\ %l:%c
set laststatus=2


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" https://github.com/vim-syntastic/syntastic#installation
"------------------------------------------------------
"execute pathogen#infect()
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"------------------------------------------------------

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" https://github.com/keith/swift.vim
"------------------------------------------------------
let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']
"------------------------------------------------------

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" open current file directory in pycharm as a project
"------------------------------------------------------
"nnoremap <F10> :!charm "%:h"<Enter><Enter>:q<Enter>
nnoremap <F10> :!charm <C-R>=expand('%:p:h')<Enter>


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Don't add a newline to the final line of a file
" https://vi.stackexchange.com/questions/3434/dont-add-new-line-at-the-end-of-a-file
"------------------------------------------------------
"set nofixeol
set nofixendofline


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Make search results appear in the middle of the screen
" https://vim.fandom.com/wiki/Make_search_results_appear_in_the_middle_of_the_screen#:~:text=When%20searching%20in%20Vim%2C%20it,to%20vertically%20center%20the%20line.
"------------------------------------------------------
"set scrolloff=9999

" scrolloff causes weird effects; use this instead?

" https://vi.stackexchange.com/a/13646

function! CenteredFindNext(forward)
    " save the current value for later restore
    let s:so_curr=&scrolloff
    set scrolloff=999
    try
        if a:forward
            silent normal! n
        else
            silent normal! N
        endif
    finally
        " restore no matter what
        let &scrolloff=s:so_curr
    endtry
endfunction

:nnoremap <silent>n :call CenteredFindNext(1)<CR>
:nnoremap <silent>N :call CenteredFindNext(0)<CR>



"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Remap leader key to space
"------------------------------------------------------

let mapleader = "\<Space>"
