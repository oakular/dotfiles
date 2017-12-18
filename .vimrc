" vimrc file for my vim config

set nocompatible " use Vim mode instead of pure Vi

set exrc
set secure

" ---------------------------------------------------
" Plug Config
" ---------------------------------------------------

call plug#begin('~/.vim/plugins')

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', {'for' : 'markdown'}
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
" Plug 'davidhalter/jedi-vim', {'for' : 'python'}

" extending vim methodology
Plug 'sjl/gundo.vim'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
" Plug 'houtsnip/vim-emacscommandline'

" colorschemes
Plug 'ajmwagar/vim-deus'
Plug 'chriskempson/base16-vim'

" source code linting
Plug 'w0rp/ale'
" Plug 'vim-syntastic/syntastic'

" filetype extensions
Plug 'blueyed/smarty.vim', {'for' : 'smarty' }

" version control
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" Plug 'lambdalisue/gina.vim'

" LaTeX
Plug 'vim-latex/vim-latex', {'for' : 'tex'}
Plug 'xuhdev/vim-latex-live-preview', {'for' : 'tex'}

" writing prose
Plug 'junegunn/goyo.vim', {'for' : 'markdown'}

call plug#end()

" ---------------------------------------------
" END PLUG CONFIG
" ---------------------------------------------

filetype plugin indent on       " load the plugins for specific file types

set encoding=utf-8              " encoding used for displaying file
set ruler                       " show the cursor position all the time
set showmatch                   " highlight matching braces
set showmode                    " show insert/replace/visual mode

" enable the mouse
set guifont=Hack:h10
set guioptions-=T               "remove toolbar
set guioptions-=r               "remove right-hand scroll bar
set guioptions-=L               "remove left-hand scroll bar

set number                      " show line numbers
" set relativenumber              " combine line numbers with absolute numbers

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
set softtabstop=4               " backspace over spaces as tabs
set tabstop=4                   " set tabulator length to 4 columns
set textwidth=80                " wrap lines automatically at 80th column:set

" set temp files dir
set swapfile
set dir=~/.vimswap

"Search settings
" Fuzzy Search
set path+=**
set wildmenu

" search settings
set hlsearch                    " highlight search results
set infercase                   " search case insensitively
set incsearch                   " sets vim to search as you type
set smartcase                   " ...unless capital letters are used
" set autochdir                   " cd to current file dir

" Use Tags
command! MakeTags !ctags -R .

" completion options
set completeopt="menu,preview,noinsert"
" enable omnifunc syntax completion
set omnifunc=syntaxcomplete#Complete

" ---------------------------------------------
"  NETRW CONFIG
" ---------------------------------------------

let g:netrw_banner=0
let g:netrw_browse_split=0
let g:netrw_hide=1
let g:netrw_list_hide='^\..*'
let g:netrw_altv=1
let g:netrw_liststyle=2

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
let g:Imap_UsePlaceHolders = 0

" ---------------------------------------------
" DISPLAY SETTINGS
" ---------------------------------------------
let base16colorspace=256
set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" " fixing term vim deus colors
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" " fixing term vim deus colors
colorscheme deus
let g:deus_termcolors=256
set background=dark
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
syntax enable

set fillchars=stl:-,stlnc:-,vert:\|

set laststatus=2
hi statusline guibg=NONE
hi statusline ctermbg=NONE
hi statusline guifg=#fdf6e3
hi statusline ctermfg=white

hi vertsplit guibg=NONE
hi vertsplit ctermbg=NONE
hi vertsplit guifg=#fdf6e3
hi vertsplit ctermfg=white

hi wildmenu guibg=NONE
hi wildmenu guifg=#d33682

if has("gui_running")
    set lines=999
    set columns=120
endif

set statusline=
set statusline +=%1*\ b%n\ %*            "buffer number
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4p\ %*             "virtual column number
set statusline +=%1*%4v\ %*             "virtual column number

" splits open below and to the right of current pane
set splitbelow
set splitright
set equalalways " resize splits when closing/splitting

set autoindent
set showmatch
set matchtime=2

" always have 1 line above or below cursor
set scrolloff=1

" formats error messages to show in vim
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

" characters for displaying non-printable characters
set listchars=eol:$,tab:>-,trail:.,nbsp:_,extends:+,precedes:+

set ttimeout
set ttimeoutlen=100

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

        " clean-up commands that run automatically on write; use with caution

        " delete empty or whitespaces-only lines at the end of file
        " autocmd BufWritePre * :%s/\(\s*\n\)\+\%$//ge

        " replace groups of empty or whitespaces-only lines with one empty line
        " autocmd BufWritePre * :%s/\(\s*\n\)\{3,}/\r\r/ge

        " delete any trailing whitespaces
        " autocmd BufWritePre * :%s/\s\+$//ge
endif

" ---------------------------------------------------
" KEY REMAPPINGS
" ---------------------------------------------------

" remap colon to open command window and start in insert mode
nnoremap : :<C-F>i
nnoremap q: :

" remapping leader to space
let mapleader = "\<Space>"

" navigating splits is now simple ctrl+j, ctrl+k
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" maps leader+w to save file
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" quick access to buffer list
nnoremap <Leader>ls :ls<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>

" access netrw quickly
nnoremap <Leader>E :Explore<CR>

" adds keys for cycling through errors
map <Leader>m :make<Return>:copen<Return>
map <Leader>- :cprevious<Return>
map <Leader>= :cnext<Return>

" maps j and k to move onto soft-wrapped lines automatically
nnoremap j gj
nnoremap k gk

" center view on the search result
noremap n nzz
noremap N Nzz

" center view when moving to top/bottom of file
nnoremap G Gzz

" hit space to turn the search results highlight off
nnoremap <Leader><space> :nohlsearch<CR>

nnoremap <silent> <Leader>t :TagbarToggle<CR>

command Bdp bd | bp
command Bdn bd | bn

" ---------------------------------------------
" GIT-GUTTER CONFIG
" ---------------------------------------------
let g:gitgutter_sign_added = '•'
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_removed = '•'
let g:gitgutter_sign_modified_removed = '•'

" ---------------------------------------------
"  VIM-LATEX CONFIG
" ---------------------------------------------
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='pdflatex -output-directory=output/ -interaction=nonstopmode $*'
let g:Tex_GotoError=0

" ---------------------------------------------
" VIM LATEX LIVE PREVIEW CONFIG
" ---------------------------------------------
let g:livepreview_previewer = 'zathura'

" ---------------------------------------------------
" VIM GUNDO CONFIG
" ---------------------------------------------------
nnoremap <Leader>g :GundoToggle<CR>
let g:gundo_width = 40
let g:gundo_preview_height = 25

" ---------------------------------------------------
" ALE CONFIG
" ---------------------------------------------------
let g:ale_lint_on_text_changed = 'normal'

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline+=%{LinterStatus()}
