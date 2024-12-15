" Configuration file for vim
set modelines=0		" CVE-2007-2438

" set UTF-8
set encoding=utf-8

" enable pathogen plugin manager
execute pathogen#infect()

" nerdtree plugin
autocmd vimenter * NERDTree

set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing
set showmatch 		" show mathing pair for []{}()

" line numbers
set number
set relativenumber

" set number of lines for cursor to move
set so=7

" enable mouse
if has('mouse')
  set mouse=a
endif

" highlight searches
set hlsearch

" ignore case when searching
set ignorecase

" enable syntax
syntax enable
syntax on

" set colorscheme
colorscheme nord 

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1

" Python Specific Configuration
let python_highlight_all = 1 " python highlighting

" run python in buffer
nnoremap <buffer> <F2> :exec '!python' shellescape(@%, 1)<cr>

" set proper PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

set colorcolumn=80              " Show the 80th char column.
highlight ColorColumn ctermbg=5

" flag unnecessary whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
