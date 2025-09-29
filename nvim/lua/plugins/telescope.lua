-- telescope
local telescope = require("telescope")
local actions = require("telescope.actions")
telescope.setup({
    extensions = {
        fzf = {
            fuzzy = true,
            overide_generic_sorter = true,
            overide_file_sorter = true,
            case_mode = "smart_case",
        }
    },
    defaults = {
        path_display = { "smart" },
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            }
        }
    }
})
