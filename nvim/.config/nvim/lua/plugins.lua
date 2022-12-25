vim.cmd [[packadd packer.nvim]]
local packer = require('packer')

local plugins = {
    {'b0o/schemastore.nvim'}, {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
            'hrsh7th/cmp-nvim-lua', 'octaltree/cmp-look', 'hrsh7th/cmp-path',
            'hrsh7th/cmp-calc', 'f3fora/cmp-spell', 'hrsh7th/cmp-emoji'
        }
    }, {
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn["mkdp#util#install"]() end
    },
    {'junegunn/goyo.vim', cmd = {'Goyo'}, requires = {'junegunn/limelight.vim'}},
    {'junegunn/rainbow_parentheses.vim'}, {'junegunn/vim-easy-align'},
    {'lervag/vimtex'},
    {'lewis6991/gitsigns.nvim', config = 'require [[config/gitsigns]]'},
    {'liuchengxu/vim-which-key', config = 'require [[config/which-key]]'},
    {'lukas-reineke/indent-blankline.nvim'},
    {'j-hui/fidget.nvim', config = 'require [[config/fidget]]'},
    {'jose-elias-alvarez/null-ls.nvim'},
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
    }, {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = 'require [[config/lualine]]'
    }, {
        'nvim-treesitter/nvim-treesitter',
        config = 'require [[config/treesitter]]',
        requires = {'p00f/nvim-ts-rainbow', 'romgrk/nvim-treesitter-context'}
    }, {'tikhomirov/vim-glsl'}, {'tomlion/vim-solidity'},
    {'tpope/vim-commentary'}, {'tpope/vim-repeat'}, {
        'tpope/vim-sexp-mappings-for-regular-people',
        ft = {'clojure', 'scheme', 'racket', 'lisp'},
        requires = {
            {'guns/vim-sexp', ft = {'clojure', 'scheme', 'racket', 'lisp'}}
        }
    }, {'tpope/vim-fugitive'}, {'tpope/vim-rhubarb'}, {'tpope/vim-sleuth'},
    {'tpope/vim-speeddating'}, {'tpope/vim-surround'},
    {'wbthomason/packer.nvim', opt = true},
    {'williamboman/mason.nvim', config = 'require [[config/mason]]'}, {
        'williamboman/mason-lspconfig.nvim',
        config = 'require [[config/mason_lspconfig]]'
    }
}

return packer.startup(function()
    for _, value in pairs(plugins) do packer.use(value) end
end)
