local lsp_status = require('lsp-status')
lsp_status.register_progress()

local nvim_lsp = require'nvim_lsp'

local on_attach_hook = function(client)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    require'completion'.on_attach(client)
    require'diagnostic'.on_attach(client)
    require'lsp-status'.on_attach(client)
    end

local default_config_servers = {
    'bashls',
    'clangd',
    'clojure_lsp',
    'cmake',
    'cssls',
    'dockerls',
    'gopls',
    'hls',
    'html',
    'jdtls',
    'jedi_language_server',
    'jsonls',
    'metals',
    'rust_analyzer',
    'solargraph',
    'sqlls',
    'sumneko_lua',
    'terraformls',
    'texlab',
    'tsserver',
    'vimls',
    'vuels',
    'yamlls'
}

for _, lsp in ipairs(default_config_servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach_hook,
        capabilities=lsp_status.capabilities,
    }
end
