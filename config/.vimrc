set nu
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
colorscheme desert

set nobackup

" set cursorline
set ruler
set autoindent

syntax on
" syntax enable

set showmatch

" set list
" set listchars=tab:\>\ ,trail:.

highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

