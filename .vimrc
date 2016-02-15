set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'tpope/vim-fugitive'

" EMMET
Plugin 'mattn/emmet-vim'

" GUNDO
Plugin 'gundo'

" indentLINE
Plugin 'Yggdroot/indentLine'

" JEDI
Plugin 'davidhalter/jedi-vim'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'

" CUTE-PYTHON
Plugin 'ehamberg/vim-cute-python'

" ADDON-MW-UTILS
Plugin 'MarcWeber/vim-addon-mw-utils'

" COLORS-SOLARIZED
Plugin 'altercation/vim-colors-solarized'

" NERDTREE
Plugin 'scrooloose/nerdtree.git'

" NERDTREE-TABS
Plugin 'jistr/vim-nerdtree-tabs'

"  MRU
Plugin 'mru.vim'

" FLAKE8
Plugin 'nvie/vim-flake8'

" DBTEXT
Plugin 'dbext.vim'

" MATCHIT
Plugin 'tmhedberg/matchit'

" SURROUND
Plugin 'tpope/vim-surround'

" vim-dispatch 
Plugin 'tpope/vim-dispatch'

" SYNTASTIC
Plugin 'scrooloose/syntastic'

" TAGBAR
Plugin 'majutsushi/tagbar'

" tComment
Plugin 'tComment'

" VIMUX
Plugin 'benmills/vimux'

" MatchTagAlways 
Plugin 'Valloric/MatchTagAlways'

" YOUCOMPLETEME
Plugin 'Valloric/YouCompleteMe'

" UltiSnips
Plugin 'SirVer/ultisnips'

" snippets
Plugin 'honza/vim-snippets'

" CTRL-P
Plugin 'kien/ctrlp.vim'

" Doxygen-Toolkit
Plugin 'vim-scripts/DoxygenToolkit.vim'

" GnuGlobal
Plugin 'vim-scripts/gtags.vim'

" Slimux
" 'https://github.com/epeli/slimux.git'

" SLIMv
Plugin 'https://github.com/kovisoft/slimv.git'

" vim-css-color
Plugin 'ap/vim-css-color'

" vimErl
Plugin 'jimenezrick/vimerl'

" ternjs
Plugin 'marijnh/tern_for_vim'

" repeat.vim
Plugin 'tpope/vim-repeat'




" Git plugin not hosted on GitHub
"""Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
"""Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"""Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"""Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set bs=indent,eol,start		" allow backspacing over everything in insert mode
" set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup fedora
  autocmd!
  """ automatic reloading of .vimrc - added by me 
  autocmd! bufwritepost .vimrc source %
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add $PWD/cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin indent on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

" }}}


" My customizations {{{
" hidden
set hidden

" nowrap
set nowrap

" set buffer screen updates, 
set lazyredraw

" highligh matching {[()]}
set showmatch

" set the ttyfast option
set ttyfast
syntax enable

" file type
filetype on
filetype plugin on

" set the leader key
 let mapleader="\\"

"  let g:solarized_contrast=""
let g:solarized_termcolors=16
let g:solarized_termtrans=0
let g:solarized_visibility="high"
set background=light
colorscheme molokai 

set hlsearch
set incsearch
set ignorecase
set smartcase
nmap \q :nohlsearch<CR>
set undolevels=50
" Better copy & paste
set pastetoggle=<leader>p
set number
set relativenumber

"tcommenter map
map <leader>c <c-_><c-_>

"PowerLine
set rtp +=/usr/lib/python2.7/site-packages/powerline/bindings/vim/
set encoding=utf-8
set nocompatible
set laststatus=2
set t_Co=256
set term=screen-256color

let g:Powerline_symbols = 'utf-8'
" let g:Powerline_symbols = 'fancy'
"set guifont=Droid\ Sans\ Mono\ for\ Powerline.otf

if has('gui_running')
	set guifont=Droid\ Sans\ Mono\ for\ Powerline
endif

" Prompt for a command to run
map rp :VimuxPromptCommand

" " Run last command executed by RunVimTmuxCommand
map rl :VimuxRunLastCommand

" " Inspect runner pane
map ri :VimuxInspectRunner

" " Close all other tmux panes in current window
map rx :VimuxCloseRunner

" " Interrupt any command running in the runner pane
map rs :VimuxInterruptRunner

" turn on command line completition wild style
set wildmenu

" turn on spell
set spell

" enable folding
set foldenable

" open most folds by default
set foldlevelstart=10

" 10 nested fold max
set foldnestmax=10

" fold based on indent level
set foldmethod=indent

" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" hightlight cursor line
 set cursorline

" Gundo
nnoremap <F5> :GundoToggle<CR>

" Python Checker for Syntastic
let g:syntastic_python_checkers=['flake8']
let g:syntastic_c_checkers=['make']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_style_error_symbol='!✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_warning_symbol='!⚠'
set statusline+=%warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*gbar

" YCM
let g:ycm_extra_conf_globlist = ['~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/*', '!~/*']
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

" Emmet stuff
" let g:user_emmet_install_global = 0
autocmd FileType djangohtml, html,css EmmetInstall

" FLAKE8
" autocmd BufWritePost *.py call Flake8()

" dbEXT

" The Silver Searcher
if executable('ag')
	" Use ag over grep
	set grepprg=ag\ --nogroup\ --nocolor

	" Use ag in CtrlP for listing files. Lighting fast and repsect .gitignore
	let g:ctrlp_user_command = 'ag %s -l -i --nocolor -g ""'

	" ag is fast enough that CtrlP doesn't need to cache
	""" let g:ctrp_use_caching = 0
endif

" UltiSnips
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
" let g:UltiSnipsListSnippets = '<c-m>'
"

" Python / Django dev
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

" }}}

set modelines=1
" vim:foldmethod=marker:foldlevel=0
