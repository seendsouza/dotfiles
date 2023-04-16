require 'config/lsp'

local options = {
  ensure_installed = DEFAULT_CONFIG_SERVERS
}
table.insert(options.ensure_installed, 'lua_ls')

require('mason-lspconfig').setup(options)
