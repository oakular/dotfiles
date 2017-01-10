" vimrc file for my vim config
" written with inspiration from Miko Bartnicki <mikobartnicki@gmail.com>

" use Vim mode instead of pure Vi, it must be the first instruction
set nocompatible

" setting up Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" ---------------------------------------------------
"  VIM plugins installed through AUR
" ---------------------------------------------------
    " airline
    " vim-commentary
    " vim-cpp-enhanced-highlight
    " vim-fugitive
    " vim-gitgutter
    " vim-gundo
    " vim-latexsuite
    " vim-youcompleteme
    " vim-nerdtree
    " vim-auto-pairs

" ---------------------------------------------------
" Vundle Plugins (where there were no AUR packages)
" ---------------------------------------------------
Plugin 'bcicen/vim-vice'
Plugin 'chriskempson/base16-vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-surround'

filetype plugin on              " load the plugins for specific file types

" display settings
set encoding=utf-8              " encoding used for displaying file
set ruler                       " show the cursor position all the time
set showmatch                   " highlight matching braces
set showmode                    " show insert/replace/visual mode

set number                      " show line numbers
set relativenumber              " combine line numbers with absolute numbers

" write settings
set confirm                     " confirm :q in for unsaved changes
set fileencoding=utf-8          " encoding used when saving file
set nobackup                    " do not keep backup files

" edit settings
set backspace=indent,eol,start  " backspacing over everything in insert mode
set expandtab                   " makes tabs spaces to keep consistency across devices
set nojoinspaces                " no extra space after '.' when joining lines
set shiftwidth=4                " set indentation depth to 4 columns
set tabstop=4                   " set tabulator length to 4 columns
set textwidth=80                " wrap lines automatically at 72nd column

"Search settings
" Fuzzy Search
set path+=**
set wildmenu

set hlsearch                    " highlight search results
set ignorecase                  " search case insensitively
set incsearch                   " sets vim to search as you type
set smartcase                   " ...unless capital letters are used

" Use Tags
command! MakeTags !ctags -R .

" file type specific settings
filetype indent on              " enable filetype detection and automatically indents code based on
                                " indent files at ~/.vim/indent/

" syntax highlighting
let base16colorspace=256        " access colors present in 256 colorspace
colorscheme chroma              " set color scheme, must be installed first
set background=dark             " dark background for console
syntax enable                   " enable syntax highlighting

" display settings
set cindent                  " sets auto indenting
set showmatch                   " sets matching of certain chars {}()[] etc

" java specific config
let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1

" java compiler config
" sets make to javac for java files
autocmd Filetype java set makeprg=javac\ %
" formats error messages to show in vim
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
" adds keys for cycling through errors
map <F9> :make<Return>:copen<Return>
map <F10> :cprevious<Return>
map <F11> :cnext<Return>

"vim-airline config
set laststatus=2                " increases the size of the command line
set ttimeoutlen=10              " prevents lag at mode change with airline
let g:airline_powerline_fonts=1 " allows airline to use powerline fonts
let g:airline#extensions#tabline#enabled = 1        "enables airline for tabs
" airline theme
let g:airline_theme='base16_grayscale'

" tmuxline config

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
" Key Remappings
" ---------------------------------------------------

" remap : to ; but keep : functionality
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" remapping leader to space
let mapleader = "\<Space>"

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

" auto insert curly brackets
" inoremap {      {}<Left>
" inoremap {<CR>  {<CR>}<Esc>O
" inoremap {{     {
" inoremap {}     {}

" auto insert quote marks (commented out as proved annoying)
"inoremap "      ""<Left>
"inoremap "<CR>  "<CR>"<Esc>O
"inoremap ""     ""

" auto insert closing bracket
" inoremap (      ()<Left>
" inoremap (<CR>  (<CR>)<Esc>O
" inoremap ()     ()
