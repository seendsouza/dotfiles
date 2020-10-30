local plugins = {
        {
                        'jreybert/vimagit',
        cmd = {'Magit'}
    },
    {
        'junegunn/goyo.vim',
        cmd = {'Goyo'},
        requires = {'junegunn/limelight.vim'}
    },
        {
        'junegunn/rainbow_parentheses.vim',
    },
        {
        'junegunn/vim-easy-align',
    },
        {
        'lervag/vimtex',
},
        {
        'liuchengxu/vista.vim',
        cmd = {'Vista'}
    },
    {      'liuchengxu/vim-which-key',
    },
    {'google/vim-maktaba'},
    {'google/vim-codefmt'},
    {'google/vim-glaive'},
    {
               'neovim/nvim-lspconfig',
        config = 'require [[config/lsp]]',
        requires = {
            'nvim-lua/completion-nvim',
            'nvim-lua/diagnostic-nvim',
            'nvim-lua/lsp-status.nvim',
        },
    },
       {
        'norcalli/nvim-colorizer.lua',
        config='require [[colorizer]].setup()',
    },
        {
                'nvim-lua/telescope.nvim',
                requires = {
                        'nvim-lua/popup.nvim',
                        'nvim-lua/plenary.nvim'
        }},
        {
        'tpope/vim-commentary'
    },
        {
        'tpope/vim-repeat'
    },
        {
        'tpope/vim-sexp-mappings-for-regular-people',
        ft = {'clojure', 'scheme', 'racket', 'lisp'},
        requires = {
            {
                'guns/vim-sexp',
                ft = {'clojure', 'scheme', 'racket', 'lisp'},
            }
        },
    },
        {
        'tpope/vim-speeddating'
    },
        {
        'tpope/vim-surround',
    },
    {
        'wbthomason/packer.nvim',
        opt = true
    },

}

return plugins
