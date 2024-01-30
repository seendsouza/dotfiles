vim.cmd [[packadd nvim-treesitter]]
require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    ignore_install = { "phpdoc" },
    highlight = {
        enable = true -- false will disable the whole extension
    },
    indent = {
            enable = true,
            disable = {"python"}
    }
}
