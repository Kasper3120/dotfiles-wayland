local lualine = require("lualine")

-- local colors = {
--     blue = "#65D1FF",
--     green = "#3EFFDC",
--     violet = "#FF61EF",
--     yellow = "#FFDA7B",
--     red = "#FF4A4A",
--     fg = "#c3ccdc",
--     bg = "#112638",
--     inactive_bg = "#2c3043",
-- }
local colors = require("tokyonight.colors").setup({style = "moon"})

local nvim_tree = {
    sections = {
        lualine_a = { "filename" },
        filetypes = "Oil",
    },
    inactive_sections = {
        lualine_a = { "filename" },
        filetypes = "Oil",
    },
}

local my_lualine_theme = {
    normal = {
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
    },
    insert = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
    },
    visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
    },
    command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
    },
    replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
    },
    inactive = {
        a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.semilightgray },
        c = { bg = colors.inactive_bg, fg = colors.semilightgray },
    },
}
--
-- configure lualine with modified theme
lualine.setup({
    options = {
        theme = my_lualine_theme,
        -- disabled_filetypes = { "packer", "NvimTree" },
        disabled_filetypes = { "packer" },
        component_separators = { left = "|", right = "|"},
        section_separators = { left = " ", right = " "},
        ignore_focus = { "NvimTree" },
        extentions = { nvim_tree },
    },
    sections = {
        lualine_x = {
            { "encoding" },
            { "fileformat" },
            { "filetype" },
        },
    },
})
