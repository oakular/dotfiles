" vimrc file for my vim config
" written with inspiration from Miko Bartnicki <mikobartnicki@gmail.com>
" and this article: https://blog.bugsnag.com/tmux-and-vim/

set nocompatible " use Vim mode instead of pure Vi

" ---------------------------------------------------
" Plug Config
" ---------------------------------------------------

call plug#begin('~/.vim/plugins')

Plug 'chriskempson/base16-vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'davidhalter/jedi-vim', {'for' : 'python'}
Plug 'benmills/vimux' " run shell commands from vim for tmux panes
Plug 'majutsushi/tagbar' " tagbar navigator
Plug 'vim-syntastic/syntastic' " syntax checking
Plug 'tpope/vim-surround' " surround text with parens etc.
Plug 'airblade/vim-gitgutter' " show edits to files in gutter
Plug 'tpope/vim-fugitive' " vim git integration
Plug 'tpope/vim-commentary' " easily comment and uncomment code
Plug 'christoomey/vim-tmux-navigator' " switch between vim and tmux splits seamlessly
Plug 'vim-latex/vim-latex'
Plug 'junegunn/goyo.vim'

"Plug 'lambdalisue/gina.vim' " git plugin
" Plug 'maralla/completor.vim' " auto complete
call plug#end()

" ---------------------------------------------
" END PLUG CONFIG
" ---------------------------------------------

filetype plugin indent on              " load the plugins for specific file types

set encoding=utf-8              " encoding used for displaying file
set ruler                       " show the cursor position all the time
set showmatch                   " highlight matching braces
set showmode                    " show insert/replace/visual mode

" enable the mouse
set mouse=a
set guifont=Hack\ 12
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set number                      " show line numbers
set relativenumber              " combine line numbers with absolute numbers

" write settings
set confirm                     " confirm :q in for unsaved changes
set fileencoding=utf-8          " encoding used when saving file
set nobackup                    " do not keep backup files
set hidden                      " no need to save when switching buffers

" edit settings
set backspace=indent,eol,start  " backspacing over everything in insert mode
set expandtab                   " makes tabs spaces to keep consistency across devices
set nojoinspaces                " no extra space after '.' when joining lines
set shiftwidth=4                " set indentation depth to 4 columns
set tabstop=4                   " set tabulator length to 4 columns
set textwidth=80                " wrap lines automatically at 80th column:set

"Search settings
" Fuzzy Search
set path+=**
set wildmenu

set hlsearch                    " highlight search results
set ignorecase                  " search case insensitively
set incsearch                   " sets vim to search as you type
set smartcase                   " ...unless capital letters are used
set autochdir                   " cd to current file dir

" Use Tags
command! MakeTags !ctags -R .

" ---------------------------------------------
"  NETRW CONFIG
" ---------------------------------------------

let g:netrw_winsize=20
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_list_hide= '.*\.swp$,.*\.pyc'
let g:netrw_altv=1
let g:netrw_liststyle=3

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | Vexplore | endif

" mutt char width
au BufRead ~/.tmp/mutt-* set wrap linebreak nolist

" ---------------------------------------------
"  VIM-LATEX CONFIG
" ---------------------------------------------

let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='pdflatex -output-directory=output/ -interaction=nonstopmode $*'
let g:Tex_GotoError=0

" ---------------------------------------------
" DISPLAY SETTINGS
" ---------------------------------------------

let base16colorspace=256
set t_Co=256
colorscheme base16-solarized-dark
set background=dark
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
syntax enable

set fillchars=stl:-,stlnc:-,vert:\|

set laststatus=2
hi statusline guibg=NONE
hi statusline guifg=#fdf6e3
hi statusline ctermbg=NONE
hi statusline ctermfg=white

hi vertsplit guibg=NONE
hi vertsplit guifg=#fdf6e3
hi vertsplit ctermbg=NONE
hi vertsplit ctermfg=white

hi wildmenu guibg=NONE
hi wildmenu guifg=#d33682

if has("gui_running")
    set lines=999
    set columns=999
endif

" splits open below and to the right of current pane
set splitbelow
set splitright

set autoindent
set showmatch
set matchtime=2

" formats error messages to show in vim
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

" adds keys for cycling through errors
map <F9> :make<Return>:copen<Return>
map <F10> :cprevious<Return>
map <F11> :cnext<Return>

" characters for displaying non-printable characters
set listchars=eol:$,tab:>-,trail:.,nbsp:_,extends:+,precedes:+

" automatic commands
if has('autocmd')
        " file type specific automatic commands

        " tuning textwidth for Java code
        autocmd FileType java setlocal textwidth=132
        if has('gui_running')
                autocmd FileType java setlocal columns=136
        endif

        " don't replace Tabs with spaces when editing makefiles
        autocmd Filetype makefile setlocal noexpandtab

        " disable automatic code indentation when editing TeX and XML files
        autocmd FileType tex,xml setlocal indentexpr=

        " clean-up commands that run automatically on write; use with caution

        " delete empty or whitespaces-only lines at the end of file
        autocmd BufWritePre * :%s/\(\s*\n\)\+\%$//ge

        " replace groups of empty or whitespaces-only lines with one empty line
        autocmd BufWritePre * :%s/\(\s*\n\)\{3,}/\r\r/ge

        " delete any trailing whitespaces
        autocmd BufWritePre * :%s/\s\+$//ge
endif

" ---------------------------------------------------
" VIM GUNDO CONFIG
" ---------------------------------------------------

let g:gundo_width = 40
let g:gundo_preview_height = 25

" ---------------------------------------------------
" Key Remappings
" ---------------------------------------------------

" remap : to ; but keep : functionality
" nnoremap ; :
" nnoremap : ;
" vnoremap ; :
" vnoremap : ;

" remapping leader to space
let mapleader = "\<Space>"

" navigating splits is now simple ctrl+j, ctrl+k
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" maps leader+w to save file
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" maps j and k to move onto soft-wrapped lines automatically
nnoremap j gj
nnoremap k gk

" center view on the search result
noremap n nzz
noremap N Nzz

" press F4 to fix indentation in whole file; overwrites marker 'q' position
noremap <F4> mqggVG=`qzz
inoremap <F4> <Esc>mqggVG=`qzza

" toggle Gundo undo tree viewer w/ F5
nnoremap <F5> :GundoToggle<CR>

" hit space to turn the search results highlight off
nnoremap <leader><space> :nohlsearch<CR>
"inoremap <F8> <Esc>:nohl<CR>a

" press F12 to toggle showing the non-printable charactes
noremap <F12> :set list!<CR>
inoremap <F12> <Esc>:set list!<CR>a

" Tagbar Toggle Key
nnoremap <silent> <Leader>t :TagbarToggle<CR>

" ---------------------------------------------
" VIMUX CONFIG
" ---------------------------------------------

" Prompt for a command to run
nnoremap <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
nnoremap <Leader>vl :VimuxRunLastCommand<CR>

" Zoom the tmux runner pane
nnoremap <Leader>vz :VimuxZoomRunner<CR>
