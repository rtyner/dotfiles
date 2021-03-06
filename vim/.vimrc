set modelines=0			" CVE-2007-2438
set encoding=utf-8		" set UTF-8
set nocompatible		" use vim defaults
set backspace=2			" more powerful backspacing
set showmatch			" show matching pair of ()[]{}
set number				" set line numbers
set relativenumber		" relative line numbers
set cursorline			" highlight entire line cursor is on
set hlsearch			" highlight searches
set ignorecase			" ignore case when searching
set clipboard=unnamed	" let vim and system clipboard work together
set splitbelow			" bottom split
set splitright			" right split

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Plugins

" enable pathogen plugin manager
execute pathogen#infect('~/.vim/bundle/{}')

filetype plugin indent on

" lightline config
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

let g:powerline_pycmd = 'py3'	" powerline font config

" enable mouse
if has('mouse')
  set mouse=a
endif

" enable syntax
let python_highlight_all=1
syntax enable
syntax on

" nord colorscheme config
colorscheme nord
let g:nord_italic_comments = 1
let g:nord_comment_brightness = 15
let g:nord_cursor_line_number_background = 1

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1

" Python Specific Configuration 

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

set colorcolumn=80           " Show the 80th char column.

set noshowmode				 " hide mode display

