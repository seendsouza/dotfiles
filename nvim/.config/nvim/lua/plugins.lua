local api = vim.api
vim.cmd [[packadd packer.nvim]]
local packer = require('packer')

local plugins = {
    {'jreybert/vimagit', cmd = {'Magit'}},
    {'junegunn/goyo.vim', cmd = {'Goyo'}, requires = {'junegunn/limelight.vim'}},
    {'junegunn/rainbow_parentheses.vim'}, {'junegunn/vim-easy-align'},
    {'lervag/vimtex'}, {'liuchengxu/vista.vim', cmd = {'Vista'}},
    {'liuchengxu/vim-which-key', config = 'require [[config/which-key]]'},
    {'google/vim-codefmt', requires = {'google/vim-maktaba', 'google/vim-glaive'}, config = 'require [[config/codefmt]]'},
    {
        'neovim/nvim-lspconfig',
        config = 'require [[config/lsp]]',
        requires = {'nvim-lua/completion-nvim', 'nvim-lua/lsp-status.nvim'}
    },
    {'norcalli/nvim-colorizer.lua', config = 'require [[colorizer]].setup()'},
    {
        'nvim-lua/telescope.nvim',
        config = 'require [[config/telescope]]',
        requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}
    },
    {
        'nvim-treesitter/nvim-treesitter',
        config = 'require [[config/treesitter]]'

    }, {'tpope/vim-commentary'}, {'tpope/vim-repeat'}, {
        'tpope/vim-sexp-mappings-for-regular-people',
        ft = {'clojure', 'scheme', 'racket', 'lisp'},
        requires = {
            {'guns/vim-sexp', ft = {'clojure', 'scheme', 'racket', 'lisp'}}
        }
    }, {'tpope/vim-speeddating'}, {'tpope/vim-surround'},
    {'wbthomason/packer.nvim', opt = true}
}

return packer.startup(function()
    for _, value in pairs(plugins) do packer.use(value) end
end)
