require('telescope').setup {
    defaults = {
        shorten_path = false
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    }
}
local set_keymap = vim.api.nvim_set_keymap

local opts = {noremap = true}
local opts_but_silent = {noremap = true, silent = true}
set_keymap('n', '<c-p>', "<cmd>lua require'telescope.builtin'.find_files{}<CR>", opts)
set_keymap('n', '<C-S-p>', "<cmd>lua require'telescope.builtin'.live_grep{}<CR>", opts)
set_keymap('n', 'gr',
           "<cmd>lua require'telescope.builtin'.lsp_references{ shorten_path = true }<CR>",
           opts_but_silent)

require('telescope').load_extension('fzf')
