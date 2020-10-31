local set_keymap = vim.api.nvim_set_keymap

local opts = {noremap = true, silent = true}
set_keymap('n', '<leader>', ":<c-u>WhichKey '<Space>'<CR>", opts)
set_keymap('n', '<localleader>', ":<c-u>WhichKey ','<CR>", opts)
