require 'config/lsp/servers'

local options = {
  ensure_installed = DEFAULT_CONFIG_SERVERS
}
table.insert(options.ensure_installed, 'lua_ls')

require("mason").setup()
local registry = require("mason-registry")
registry.refresh()
require('mason-lspconfig').setup(options)

