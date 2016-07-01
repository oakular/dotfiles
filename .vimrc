"Configuration file for Vi Improved, save as ~/.vimrc to use.
" Written on 2014-07-16 by Miko Bartnicki <mikobartnicki@gmail.com>.

" use Vim mode instead of pure Vi, it must be the first instruction
set nocompatible

" setting up Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" display settingsn
set encoding=utf-8 " encoding used for displaying file
set ruler " show the cursor position all the time
set showmatch " highlight matching braces
set showmode " show insert/replace/visual mode
set number
set relativenumber

" write settings
set confirm " confirm :q in case of unsaved changes
set fileencoding=utf-8 " encoding used when saving file
set nobackup " do not keep the backup~ file

" edit settings
set backspace=indent,eol,start " backspacing over everything in insert mode
set noexpandtab " no spaces!
set nojoinspaces " no extra space after '.' when joining lines
set shiftwidth=4 " set indentation depth to 8 columns
set tabstop=4 " set tabulator length to 8 columns
set textwidth=72 " wrap lines automatically at 72nd column

"Search settings
set hlsearch " highlight search results
set ignorecase " do case insensitive search...
set incsearch " do incremental search
set smartcase " ...unless capital letters are used

" file type specific settings
filetype on " enable file type detection
filetype plugin on " load the plugins for specific file types
filetype indent on " automatically indent code

" syntax highlighting
colorscheme base16-londontube " set color scheme, must be installed first
let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark " dark background for console
syntax enable " enable syntax highlighting

	" java specific config
	set ai
	set sm
	let java_highlight_all=1

	let java_highlight_functions="style"

	let java_allow_cpp_keywords=1

"vim-airline config
set laststatus=2
set ttimeoutlen=10
let g:airline_powerline_fonts=1

" characters for displaying non-printable characters
set listchars=eol:$,tab:>-,trail:.,nbsp:_,extends:+,precedes:+

" tuning for gVim only
if has('gui_running')
	set background=light " light background for GUI
	set columns=84 lines=48 " GUI window geometry
	set guifont=Monospace\ 12 " font for GUI window
        set number " show line numbers
	endif

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

" general key mappings

" center view on the search result
noremap n nzz
noremap N Nzz

" press F4 to fix indentation in whole file; overwrites marker 'q' position
noremap <F4> mqggVG=`qzz
inoremap <F4> <Esc>mqggVG=`qzza

" press F5 to sort selection or paragraph
vnoremap <F5> :sort i<CR>
nnoremap <F5> Vip:sort i<CR>

" press F8 to turn the search results highlight off
noremap <F8> :nohl<CR>
inoremap <F8> <Esc>:nohl<CR>a

" press F12 to toggle showing the non-printable charactes
noremap <F12> :set list!<CR>
inoremap <F12> <Esc>:set list!<CR>a

" java compiler
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <F9> :make<Return>:copen<Return>
map <F10> :cprevious<Return>
map <F11> :cnext<Return>

" Vim Plugins (Vundle)
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
