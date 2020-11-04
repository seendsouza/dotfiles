local lsp_status = require('lsp-status')
lsp_status.register_progress()

local nvim_lsp = require 'nvim_lsp'

local on_attach_hook = function(client)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    require'completion'.on_attach(client)
    require'diagnostic'.on_attach(client)
    require'lsp-status'.on_attach(client)

    local set_keymap = vim.api.nvim_buf_set_keymap
    local opts = {noremap = true, silent = true}

    set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    set_keymap(bufnr, 'n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>',
               opts)
    set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>',
               opts)
    set_keymap(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>',
               opts)
    set_keymap(bufnr, 'n', '<leader>gw',
               '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
    set_keymap(bufnr, 'n', '<leader>gW',
               '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
    set_keymap(bufnr, 'n', '<leader>ah', '<cmd>lua vim.lsp.buf.hover()<CR>',
               opts)
    set_keymap(bufnr, 'n', '<leader>af',
               '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    set_keymap(bufnr, 'n', '<leader>ee',
               '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opts)
    set_keymap(bufnr, 'n', '<leader>ar', '<cmd>lua vim.lsp.buf.rename()<CR>',
               opts)
    set_keymap(bufnr, 'n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>',
               opts)
    set_keymap(bufnr, 'n', '<leader>ai',
               '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts)
    set_keymap(bufnr, 'n', '<leader>ao',
               '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', opts)
end

local default_config_servers = {
    'bashls', 'clangd', 'clojure_lsp', 'cmake', 'cssls', 'dockerls', 'gopls',
    'hls', 'html', 'jdtls', 'jedi_language_server', 'jsonls', 'metals', 'nimls',
    'rust_analyzer', 'solargraph', 'sqlls', 'sumneko_lua', 'terraformls',
    'texlab', 'tsserver', 'vimls', 'vuels', 'yamlls'
}

for _, lsp in ipairs(default_config_servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach_hook,
        capabilities = lsp_status.capabilities
    }
end
