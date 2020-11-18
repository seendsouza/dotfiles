"seen's nvim init.vim

filetype plugin indent on
syntax on
colorscheme molokai


set clipboard=unnamedplus
set complete+=kspell
set completeopt=menuone,noinsert,noselect
set conceallevel=1
set cursorline
set encoding=utf8
set expandtab 
set laststatus=2
set list
set number relativenumber
set path+=**
set ruler
set shortmess+=c
set smarttab
set termguicolors
set wildmenu


hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE


let form_enhanced_color = 1
let base16colorspace=256  " Access colors present in 256 colorspace
let g:python3_host_prog='/usr/bin/python3'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'


lua require('plugins')
autocmd BufWritePost plugins.lua PackerCompile

autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.md set filetype=markdown


" Autoformat Settings
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

" Rainbow Lisp Settings
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END


" EasyAlign Settings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" Spell Settings
map <silent> <F7> "<Esc>:silent setlocal spell! spelllang=en<CR>"
map <silent> <F6> "<Esc>:silent setlocal spell! spelllang=fr<CR>"
" Escape command line mode
cnoremap kj <C-C>
cnoremap jk <C-C>
" Time
nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>


function! LspStatus() abort
    if luaeval('#vim.lsp.buf_get_clients() > 0')
        return luaeval("require('lsp-status').status()")
    endif

    return ''
endfunction
