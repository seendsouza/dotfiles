require 'config/lsp'

local options = {
  ensure_installed = DEFAULT_CONFIG_SERVERS
}
table.insert(options.ensure_installed, 'sumneko_lua')

require('mason-lspconfig').setup(options)
