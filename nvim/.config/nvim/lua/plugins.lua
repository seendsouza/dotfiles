vim.cmd [[packadd packer.nvim]]
local packer = require('packer')

local plugins = {
    {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
            'quangnguyen30192/cmp-nvim-ultisnips', 'hrsh7th/cmp-nvim-lua',
            'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
            'f3fora/cmp-spell', 'hrsh7th/cmp-emoji'
        }
    },
    {'jreybert/vimagit', cmd = {'Magit'}},
    {'junegunn/goyo.vim', cmd = {'Goyo'}, requires = {'junegunn/limelight.vim'}},
    {'junegunn/rainbow_parentheses.vim'}, {'junegunn/vim-easy-align'},
    {'lervag/vimtex'}, {'liuchengxu/vista.vim', cmd = {'Vista'}},
    {'liuchengxu/vim-which-key', config = 'require [[config/which-key]]'},
    {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}},
    {
        'neovim/nvim-lspconfig',
        config = 'require [[config/lsp]]',
        requires = {'nvim-lua/lsp-status.nvim'}
    },
    {'norcalli/nvim-colorizer.lua', config = 'require [[colorizer]].setup()'},
    {
        'nvim-lua/telescope.nvim',
        config = 'require [[config/telescope]]',
        requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}
    },
    {
        'nvim-treesitter/nvim-treesitter',
        config = 'require [[config/treesitter]]',
        requires = {'p00f/nvim-ts-rainbow',
                    'romgrk/nvim-treesitter-context'}

    }, {'tpope/vim-commentary'}, {'tpope/vim-repeat'}, {
        'tpope/vim-sexp-mappings-for-regular-people',
        ft = {'clojure', 'scheme', 'racket', 'lisp'},
        requires = {
            {'guns/vim-sexp', ft = {'clojure', 'scheme', 'racket', 'lisp'}}
        }
    }, {'tpope/vim-speeddating'}, {'tpope/vim-surround'},
    {'wbthomason/packer.nvim', opt = true},
    {'williamboman/mason.nvim', config = 'require [[config/mason]]'},
    {'williamboman/mason-lspconfig.nvim', config = 'require [[config/mason_lspconfig]]'}
}

return packer.startup(function()
    for _, value in pairs(plugins) do packer.use(value) end
end)
