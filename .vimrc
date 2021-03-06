" Begin NeoBundle setup
"
"
set nocompatible               " Be iMproved

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" After install, cd ~/.vim/bundle/vimproc; make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

NeoBundle 'Shougo/vimshell'

" let Vundle manage Vundle. Required!
NeoBundle 'git://github.com/gmarik/vundle'

" Scala support
NeoBundle 'git://github.com/leifwickland/vim-scala-ftplugin'
NeoBundle 'git://github.com/leifwickland/scala-vim-support'

" Dear self, you always forget that this plugin is broken because it has a .vim file in DOS format.
" I ended up making my own repo so I could fix that irritation.
NeoBundle 'git://github.com/leifwickland/cvsmenu.vim'

" Git support
NeoBundle 'git://github.com/tpope/vim-fugitive'

" Adds a sidebar displaying the current file's methods, members, etc.
NeoBundle 'git@github.com:leifwickland/tagbar.git'

" PHP support
NeoBundle 'git://github.com/leifwickland/vim-php-support'

" Markdown support
NeoBundle 'git://github.com/tpope/vim-markdown'

" Run a proper terminal within vim!
" NeoBundle 'git://github.com/rson/vim-conque'

" Beautify Javascript. Clone of jsbeautify.org.
NeoBundle 'git://github.com/vim-scripts/jsbeautify'

"Compiler support for Mono's C# compiler, gmcs
NeoBundle 'git://github.com/vim-scripts/gmcs.vim'

" Epic plugin for displaying VIM's undo tree.
NeoBundle 'git://github.com/sjl/gundo.vim'

" Support for Ensime/vimside
"NeoBundle 'git://github.com/megaannum/self'
"NeoBundle 'git://github.com/megaannum/forms'
"
" Ensime (scala) support
"NeoBundle 'git://github.com/megaannum/vimside'

filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

" End NeoBundle setup

syntax on

" Highlight search results. Search incrementally as I type.
set hlsearch incsearch

" See http://code.google.com/p/conque/wiki/Usage
let g:ConqueTerm_ReadUnfocused = 1

if has("gui_running")
  set guioptions+=a
  set guioptions-=T
  set guioptions-=r
  set guioptions-=l
  set guioptions-=R
  set guioptions-=L

  set title titlestring=VIM\ -\ %F\ %h "make sure that the window caption setting is turned on and set caption to vim 5.x style

  au GUIEnter * simalt ~x " Maximize GVim on startup.
else
  " I really like how this looks in Putty and really hate how it looks in gvim
  colorscheme desert
endif

" set the location swap files are written to
set directory=~/.vim/.swp

if version >= 703
  " Let vim create undo files so changes can be undone across file reloads
  " Came into existence in vim 7.3.
  set undofile
  set undodir=~/.vim/.undo
else
endif

" Fiddle with indentation options.
set cino+=(0,g0,:0

" Use F8 to clear search highlighting
nnoremap <F8> :noh<cr>
inoremap <F8> <c-o>:noh<cr>

" The odds that I meant 'look up a man page for the word under the cursor'
" rather than go up are infinitesimally small.
nmap K k

" Idem. above except digram characters.
nmap <c-k> k

" Yes, please, grep recursively.
set grepprg+=\ -R

" Scala specific grep
command! -nargs=+ GS :grep --include='*.scala' <args> */
command! -nargs=+ GSS :grep --include='*.scala' <args>

vmap * y/<c-r>"<cr>

" No, I don't want you to keep all the windows the same height.
set noequalalways

" But I do want to keep all windows the same width by default.
set eadirection="ver"

set diffopt+=iwhite,context:15

" Swap around ' and ` because the ` version jumps to a particular line and column, not just a particular line.
nnoremap ' `
nnoremap ` '

" Don't wrap. Indent 2 spaces. Use spaces, not tabs.
set textwidth=0 tabstop=2 shiftwidth=2 expandtab

" Include useful stuff in the status line: buffer number, file name, current line & column, percentage through file.
set statusline=\[%02n\]%*%<\ %f\ %h%m%r%*%=%-14.(%l,%c%)%P

" Always show a status line.
set laststatus=2

"Allow my windows to be smushed to zero height.
set winminheight=0

" How about I use version control instead of having every file write result in a .bak file?
set nobackup

" Dear self, please never remove this again. You'll miss the way it tells you the number of visually selected lines. Affectionately, self.
set showcmd

" I like to set this to slightly more so that if a command prints two or three lines, I don't have to scroll through it.
set cmdheight=3

"Remember more lines of command line history, please.
set history=9999

" Make ctrl-\ like ctrl-], but split the window
nnoremap <c-\> :stag <c-r><c-w><cr>

" Treat *.phph files as if they're *.php files.
au BufNewFile,BufRead *.phph            setf php

" Treat *.json files as javascript
au BufNewFile,BufRead *.json            setf javascript

" In order to show matches and to format (), [], and {} nicely when they
" appear on multiple lines.
set showmatch matchtime=15
inoremap } }<bs>}
inoremap ) )<bs>)
inoremap ] ]<bs>]

" Correct common misspellings of common commands
command! -nargs=? Res :res <args>
command! -nargs=? Re :res <args>
command! -nargs=? R :res <args>
cabbr mka mak
cab re res
cab SEx Sex
