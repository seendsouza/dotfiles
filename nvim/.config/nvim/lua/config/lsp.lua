local lsp_status = require('lsp-status')
local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

lsp_status.register_progress()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_extend('keep', capabilities or {},
                              lsp_status.capabilities)
cmp_nvim_lsp.update_capabilities(capabilities)

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

local on_attach = function(client, bufnr)
    attach_hook(lsp_status.on_attach)(client, bufnr)

    if client.name == 'efm' and
        client.server_capabilities.documentFormattingProvider then
        set_keymap(bufnr, 'n', '<leader>f',
                   '<cmd>lua vim.lsp.buf.format {timeout_ms = 500, filter = function(c) return c.name == "efm" end}<CR>',
                   opts)
        vim.api.nvim_create_augroup('formatting', {clear = true})
        vim.api.nvim_create_autocmd({"BufWritePre"}, {
            group = 'formatting',
            callback = function()
                vim.lsp.buf.format {
                    timeout_ms = 500,
                    filter = function(c)
                        return c.name == "efm"
                    end
                }
            end
        })
    end
end

DEFAULT_CONFIG_SERVERS = {
    'bashls', 'clangd', 'clojure_lsp', 'cmake', 'cssls', 'dockerls', 'gopls',
    'hls', 'html', 'jdtls', 'jedi_language_server', 'jsonls',
    'kotlin_language_server', 'metals', 'nimls', 'rust_analyzer', 'solargraph',
    'sqlls', 'terraformls', 'texlab', 'tsserver', 'vimls', 'vuels', 'yamlls'
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

local black = require "config/efm/black"
local clang_format = require "config/efm/clang_format"
local eslint = require "config/efm/eslint"
local flake8 = require "config/efm/flake8"
local go_vet = require "config/efm/go_vet"
local hadolint = require "config/efm/hadolint"
local isort = require "config/efm/isort"
local ktlint = require "config/efm/ktlint"
local lua_format = require "config/efm/lua_format"
local mypy = require "config/efm/mypy"
local prettier = require "config/efm/prettier"
local rustfmt = require "config/efm/rustfmt"
local shellcheck = require "config/efm/shellcheck"
local shfmt = require "config/efm/shfmt"
local staticcheck = require "config/efm/staticcheck"
local terraform = require "config/efm/terraform"

local languages = {
    c = {clang_format},
    cpp = {clang_format},
    css = {prettier},
    dockerfile = {hadolint},
    go = {staticcheck, go_vet},
    html = {prettier},
    javascriptreact = {prettier, eslint},
    javascript = {prettier, eslint},
    json = {prettier},
    kotlin = {ktlint},
    lua = {lua_format},
    markdown = {prettier},
    python = {black, isort, flake8, mypy},
    rust = {rustfmt},
    scss = {prettier},
    sh = {shellcheck, shfmt},
    terraform = {terraform},
    typescript = {prettier, eslint},
    typescriptreact = {prettier, eslint},
    yaml = {prettier}

}

lspconfig['efm'].setup {
    capabilities = capabilities,
    init_options = {documentFormatting = true},
    filetypes = vim.tbl_keys(languages),
    on_attach = on_attach,
    settings = {
        rootMarkers = {".git/"},
        languages = languages,
        lintDebounce = 100,
        logLevel = 5
    }
}
