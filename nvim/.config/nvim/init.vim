"seen's nvim init.vim

set encoding=utf8
set complete+=kspell
"
set relativenumber
set list
set ruler
set smarttab
set expandtab 
set laststatus=2

set cursorline

set conceallevel=1

set path+=**
set wildmenu

set clipboard=unnamedplus

filetype plugin indent on
syntax on
colorscheme molokai
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE


call plug#begin('~/.local/share/nvim/plugged')
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'dart-lang/dart-vim-plugin'

Plug 'lervag/vimtex'

Plug 'guns/vim-clojure-highlight'
Plug 'guns/vim-sexp'

Plug 'junegunn/rainbow_parentheses.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fireplace'

Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'liuchengxu/vista.vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'Shougo/denite.nvim'
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
if has('win32') || has('win64')
  Plug 'tbodt/deoplete-tabnine', { 'do': 'powershell.exe .\install.ps1' }
else
  Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
endif
call plug#end()

" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /home/seen/bin/jars/google-java-format-1.7-all-deps.jar"

let g:python3_host_prog='/usr/bin/python3'
let dart_style_guide = 2
let dart_format_on_save = 1
let form_enhanced_color = 1
let base16colorspace=256  " Access colors present in 256 colorspace
let g:gitgutter_max_signs = 500  " default value
let g:gitgutter_async=0
let g:deoplete#enable_at_startup = 1
let g:vim_jsx_pretty_colorful_config = 1
let g:airline_theme='minimalist'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'

autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  " autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType html,css,json,javascript,vue AutoFormatBuffer prettier
  autocmd FileType clojure AutoFormatBuffer zprint
augroup END

" Activation based on file type
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

map <silent> <F7> "<Esc>:silent setlocal spell! spelllang=en<CR>"
map <silent> <F6> "<Esc>:silent setlocal spell! spelllang=fr<CR>"
map <C-n> :NERDTreeToggle<CR>
cnoremap kj <C-C>
cnoremap jk <C-C>
nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
command! MakeTags !ctags -R .
