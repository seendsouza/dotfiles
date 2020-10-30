-- totally optional to use setup
require('telescope').setup {
  defaults = {
    shorten_path = false -- currently the default value is true
  }
}
local set_keymap = vim.api.set_keymap

local opts = { noremap=true}
set_keymap('n', '<c-p>', "<cmd>lua require'telescope.builtin'.find_files{}<CR>", opts)
set_keymap('n', '<silent> gr', "<cmd>lua require'telescope.builtin'.lsp_references{ shorten_path = true }<CR>", opts)
