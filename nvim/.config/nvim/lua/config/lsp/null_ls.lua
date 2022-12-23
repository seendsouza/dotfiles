local null_ls = require("null-ls")
local b = null_ls.builtins

local with_root_file = function(...)
    local files = {...}
    return function(utils) return utils.root_has_file(files) end
end

local sources = {
    -- formatting
    b.formatting.prettier, b.formatting.fish_indent, b.formatting.shfmt,
    b.formatting.clang_format, b.formatting.rustfmt.with(
        {
            extra_args = function(params)
                local Path = require("plenary.path")
                local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

                if cargo_toml:exists() and cargo_toml:is_file() then
                    for _, line in ipairs(cargo_toml:readlines()) do
                        local edition = line:match([[^edition%s*=%s*%"(%d+)%"]])
                        if edition then
                            return {"--edition=" .. edition}
                        end
                    end
                end
                -- default edition when we don't find `Cargo.toml` or the `edition` in it.
                return {"--edition=2021"}
            end
        }),
    b.formatting.trim_whitespace.with({filetypes = {"tmux", "snippets"}}),
    b.diagnostics.write_good, b.diagnostics.markdownlint, -- code actions
    b.code_actions.gitsigns, b.code_actions.gitrebase, b.hover.dictionary
}

local M = {}
M.setup = function(on_attach)
    null_ls.setup({
        -- debug = true,
        sources = sources,
        on_attach = on_attach
    })
end

return M
