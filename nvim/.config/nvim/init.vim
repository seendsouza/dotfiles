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

autocmd BufRead,BufNewFile *.cls set filetype=tex

autocmd BufNewFile,BufRead *.bnf set filetype=bnf

au BufNewFile,BufRead *.ejs set filetype=html
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

function CopyDiffToBuffer(input, output, bufname)
  let min_len = min([len(a:input), len(a:output)])
  for i in range(0, min_len - 1)
    let output_line = a:output[i]
    let input_line  = a:input[i]
    if input_line != output_line
      call setline(i + 1, output_line) " lines calculate from 1, items - from 0
    end
  endfor
  if len(a:input) != len(a:output)
    if min_len == len(a:output) " remove all extra lines from input
      call deletebufline(a:bufname, min_len + 1, "$")
    else " append all extra lines from output
      call append("$", a:output[min_len:])
    end
  end

  redraw!
endfunction

function LuaFormat()
  let input = getline(1, "$")
  let error_file = tempname()
  let flags = " -i "
  let config_file = findfile(".lua-format", ".;")
  if empty(config_file) == 0
    let flags = flags . " -c " . config_file
  end
  let output_str=system("lua-format " . flags . " 2> " . error_file, input)
  if empty(output_str) == 0
    let output = split(output_str, "\n")
    call CopyDiffToBuffer(input, output, bufname("%"))
    lexpr ""
    lwindow
  else
    let errors = readfile(error_file)
    let source_file = bufname("%")
    call insert(errors, source_file)

    set efm=%+P%f,line\ %l:%c\ %m,%-Q
    lexpr errors
    lwindow 5
  end
  call delete(error_file)
endfunction


autocmd FileType lua nnoremap <buffer> <c-k> :call LuaFormat()<cr>
autocmd BufWrite *.lua call LuaFormat()

" Autoformat Settings
" augroup autoformat_settings
"   autocmd FileType bzl AutoFormatBuffer buildifier
"   autocmd FileType c,cpp,proto AutoFormatBuffer clang-format
"   autocmd FileType dart AutoFormatBuffer dartfmt
"   autocmd FileType go AutoFormatBuffer gofmt
"   autocmd FileType gn AutoFormatBuffer gn
"   " autocmd FileType html,css,json AutoFormatBuffer js-beautify
"   autocmd FileType java AutoFormatBuffer google-java-format
"   autocmd FileType python AutoFormatBuffer autopep8
"   autocmd FileType rust AutoFormatBuffer rustfmt
"   autocmd FileType html,css,json,javascript,typescript,vue,javascriptreact,typescriptreact AutoFormatBuffer prettier
"   autocmd FileType clojure AutoFormatBuffer zprint
" augroup END

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
