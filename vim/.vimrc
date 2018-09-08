set modelines=0		" CVE-2007-2438
set encoding=utf-8	" set UTF-8

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

autocmd vimenter * NERDTree     " start NERDTree with vim

set noshowmode		" remove mode display since lightline handles this
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing
set showmatch 		" show mathing pair for []{}()

" line numbers
set number
set relativenumber
set cursorline

" enable mouse
if has('mouse')
  set mouse=a
endif

set hlsearch		" highlight searches
set ignorecase		" ignore case when searching

" enable syntax
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

"""""""""""""""""""""""""""""""""
" Python Specific Configuration "
"""""""""""""""""""""""""""""""""
set ts=4		" tabs = 4 spaces
let python_highlight_all = 1 " python highlighting
set autoindent		" indent when moving to the next line

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
highlight ColorColumn ctermbg=9

" flag unnecessary whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
