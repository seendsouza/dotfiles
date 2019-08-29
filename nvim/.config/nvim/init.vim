"seen's nvim init.vim

set nocompatible

set encoding=utf8
set complete+=kspell

set number
set ruler
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab 
set laststatus=2

set cursorline


filetype plugin on
syntax on
colorscheme molokai
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE


call plug#begin('~/.local/share/nvim/plugged')
Plug 'vimwiki/vimwiki'
Plug 'dart-lang/dart-vim-plugin'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'airblade/vim-gitgutter'
call plug#end()

" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"

let g:python3_host_prog = '/home/seen/.pyenv/versions/3.6.6/bin/python'
let g:vimwiki_list = [{'path': '~/Documents/notes', 'syntax': 'markdown', 'ext': '.md'}]
let dart_style_guide = 2
let dart_format_on_save = 1
let form_enhanced_color = 1
let base16colorspace=256  " Access colors present in 256 colorspace
let g:gitgutter_max_signs = 500  " default value
let g:gitgutter_async=0

autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.md set filetype=markdown

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer autopep8
augroup END

map <silent> <F7> "<Esc>:silent setlocal spell! spelllang=en<CR>"
map <silent> <F6> "<Esc>:silent setlocal spell! spelllang=fr<CR>"
map <C-K> :pyf ~/.config/nvim/clang-format.py<cr>
imap <C-K> <c-o>:pyf ~/.config/nvim/clang-format.py<cr>
