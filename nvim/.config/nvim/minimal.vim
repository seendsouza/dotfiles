"seen's nvim minimal init.vim

set encoding=utf8
set complete+=kspell
"
set number relativenumber
set list
set ruler
set smarttab
set expandtab 
set laststatus=2

set cursorline

set conceallevel=1

set path+=**
set wildmenu
set termguicolors

set clipboard=unnamedplus

filetype plugin indent on
syntax on
colorscheme molokai
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
