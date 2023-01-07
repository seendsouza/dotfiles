local lsp_status = require('lsp-status')
local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

lsp_status.register_progress()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_extend('keep', capabilities or {},
                              lsp_status.capabilities)
cmp_nvim_lsp.default_capabilities(capabilities)

local set_keymap = vim.api.nvim_buf_set_keymap
local opts = {noremap = true, silent = true}

local attach_hook = function(status_callback)
    return function(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        status_callback(client)

        set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>',
                   opts)
        set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>',
                   opts)
        set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>',
                   opts)
        set_keymap(bufnr, 'n', 'gs',
                   '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        set_keymap(bufnr, 'n', 'gi',
                   '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        set_keymap(bufnr, 'n', 'gt',
                   '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        set_keymap(bufnr, 'n', '<leader>gw',
                   '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
        set_keymap(bufnr, 'n', '<leader>gW',
                   '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
        set_keymap(bufnr, 'n', '<leader>ah', '<cmd>lua vim.lsp.buf.hover()<CR>',
                   opts)
        set_keymap(bufnr, 'n', '<leader>af',
                   '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        set_keymap(bufnr, 'n', '<leader>ee',
                   '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
                   opts)
        set_keymap(bufnr, 'n', '<leader>ar',
                   '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        set_keymap(bufnr, 'n', '<leader>=',
                   '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
        set_keymap(bufnr, 'n', '<leader>ai',
                   '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts)
        set_keymap(bufnr, 'n', '<leader>ao',
                   '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', opts)
    end
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client) return client.name == "null-ls" end,
        bufnr = bufnr
    })
end

local on_attach = function(client, bufnr)
    attach_hook(lsp_status.on_attach)(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function() lsp_formatting(bufnr) end
        })
    end
end

DEFAULT_CONFIG_SERVERS = {
    'bashls', 'clangd', 'clojure_lsp', 'cmake', 'cssls', 'dockerls', 'gopls',
    'hls', 'html', 'jdtls', 'jedi_language_server', 'jsonls',
    'kotlin_language_server', 'nimls', 'rust_analyzer', 'solargraph', 'solc', 'sqlls',
    'terraformls', 'texlab', 'tsserver', 'vimls', 'vuels', 'yamlls'
}

for _, lsp in ipairs(DEFAULT_CONFIG_SERVERS) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {documentFormatting = false}
    }
end

lspconfig['sumneko_lua'].setup {
    cmd = {"lua-language-server"},
    init_options = {documentFormatting = false},
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {Lua = {diagnostics = {globals = {'vim'}}}},
    workspace = {
        library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
        }
    }
}

require('config/lsp/null_ls').setup(on_attach)
