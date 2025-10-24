-- oil
require("oil").setup({
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,

    is_hidden_file = function (name, bufnr)
        local not_hidden = {
            [".gitignore"] = true,
            [".gitlab-ci.yml"] = true
        }
        if not_hidden[name] then
            return true
        end

        local m = name:match("^%.")
        return m ~= nil
    end,

    columns = {
        "icon",
        "size",
        "mtime",
    },
    keymaps = {
        ["g?"] = { "actions.show_help", mode = "n" },
        ["<CR>"] = "actions.select",
        ["<leader>v"] = { "actions.select", opts = { vertical = true } },
        ["<leader>h"] = { "actions.select", opts = { horizontal = true } },
        ["<C-t>"] = { "actions.select", opts = { tab = true } },
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = { "actions.close", mode = "n" },
        ["<C-r>"] = "actions.refresh",
        ["-"] = { "actions.parent", mode = "n" },
        ["_"] = { "actions.open_cwd", mode = "n" },
        ["`"] = { "actions.cd", mode = "n" },
        ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
        ["gs"] = { "actions.change_sort", mode = "n" },
        ["gx"] = "actions.open_external",
        ["g."] = { "actions.toggle_hidden", mode = "n" },
        ["g\\"] = { "actions.toggle_trash", mode = "n" },
        ["<C-l>"] = false,
        ["<C-h>"] = false,
    },
})

