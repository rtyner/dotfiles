set modelines=0			  " CVE-2007-2438
set encoding=utf-8		  " set UTF-8
set nocompatible		  " use vim defaults
set backspace=2			  " more powerful backspacing
set showmatch			  " show matching pair of ()[]{}
set number				  " set line numbers
set relativenumber		  " relative line numbers
set cursorline			  " highlight entire line cursor is on
set hlsearch			  " highlight searches
set ignorecase			  " ignore case when searching
set clipboard=unnamed	  " let vim and system clipboard work together
set splitbelow			  " bottom split
set splitright			  " right split
set mouse=a
set wildmode=longest,list " get bash-like tab completion
set incsearch			  " incremental search
set colorcolumn=80        " Show the 80th char column.
set noshowmode			  " hide mode display
set ttyfast				  " speed up scrolling
set backupdir=~/.cache/vim " stores backup files

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" python specific configuration

set ts=4					 " tabs = 4 spaces
let python_highlight_all = 1 " python highlighting
set autoindent		         " indent when moving to the next line

" run python in buffer
nnoremap <buffer> <F2> :exec '!python' shellescape(@%, 1)<cr>

" set proper PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" plugins

call plug#begin()
 " Plugin Section
 Plug 'arcticicestudio/nord-vim'
 Plug 'ryanoasis/vim-devicons'
 Plug 'vim-airline/vim-airline'
" Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" color schemes
" if (has("termguicolors"))
" set termguicolors
" endif
" syntax enable
" colorscheme evening
" colorscheme " open new split panes to right and below

set splitright
set splitbelow
