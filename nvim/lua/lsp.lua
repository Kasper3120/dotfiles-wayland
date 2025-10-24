-- diagnostics
local severity_to_letter = {
    [vim.diagnostic.severity.ERROR] = "E:",
    [vim.diagnostic.severity.WARN] = "W:",
    [vim.diagnostic.severity.INFO] = "I:",
    [vim.diagnostic.severity.HINT] = "H:",
}
vim.diagnostic.config({
    virtual_text = {
        prefix = function (d)
            return severity_to_letter[d.severity]
        end,
        spacing = 2,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true
})

-- lua_ls
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})
