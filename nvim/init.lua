vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"

vim.o.wrap = false

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true

vim.o.swapfile = false
vim.g.mapleader = " "

vim.o.termguicolors = true
vim.o.background = "dark"
vim.o.cursorline = true

vim.o.backspace = "indent,eol,start"

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.scrolloff = 10
vim.o.winborder = "rounded"

vim.o.undofile = true
vim.o.ignorecase = true

--- PLUGINS/MODULES
vim.pack.add({
    { src = "https://github.com/stevearc/oil.nvim" },
    -- telescope deps
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    -- TODO: wait for update and find ow to include it
    { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
    { src = "https://github.com/BurntSushi/ripgrep" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter",          version = "main" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    -- cmp deps
    { src = 'https://github.com/hrsh7th/cmp-nvim-lsp' },
    { src = 'https://github.com/hrsh7th/cmp-buffer' },
    { src = 'https://github.com/hrsh7th/cmp-path' },
    { src = 'https://github.com/hrsh7th/cmp-cmdline' },
    { src = 'https://github.com/saadparwaiz1/cmp_luasnip' },
    { src = 'https://github.com/rafamadriz/friendly-snippets' },
    { src = 'https://github.com/hrsh7th/nvim-cmp' },

    { src = "https://github.com/windwp/nvim-autopairs" },
    { src = "https://github.com/gbprod/substitute.nvim" },
    { src = "https://github.com/kdheepak/lazygit.nvim" },
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
    { src = "https://github.com/kylechui/nvim-surround" },
    { src = "https://github.com/folke/todo-comments.nvim" },
    { src = "https://github.com/aserowy/tmux.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-lua/lsp-status.nvim" },
    { src = "https://github.com/nvim-lualine/lualine.nvim"},
    { src = "https://github.com/folke/tokyonight.nvim"}
})
require("mason").setup({})
require("tmux").setup({})
require("nvim-surround").setup({})
-- oil
require("oil").setup({
    default_file_explorer = true,
    columns = {
        "icon",
        "size"
    },
})

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

--- cmp
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
local luasnip = require("cmp_luasnip")
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
cmp.setup({
    completion = {
        completeopt = "menu,menuone,preview,noselect"
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    }),
})
require('nvim-autopairs').setup({})



vim.lsp.enable({ "lua_ls", "python-lsp-server" })

local vk = vim.keymap
vk.set('n', '<leader>lf', vim.lsp.buf.format)
vk.set('n', '<leader>o', '<cmd>update<CR>,<cmd>source<CR>')
vk.set('n', '<leader>w', '<cmd>write<CR>')
vk.set('n', '<leader>q', '<cmd>quit<CR>')
vk.set('n', '<leader>e', '<cmd>Oil<CR>')
vk.set('n', '<leader>lg', '<cmd>LazyGit<CR>')


-- sed
vk.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { noremap = true, silent = false })
vk.set('v', '<leader>s', [["sy: '<,'>s/<C-r>s/<C-r>s/gI<Left><Left><Left>]], { noremap = true, silent = false })


-- tabs
vk.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = "Open new tab" })
vk.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = "Close tab" })
vk.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = "Go to next tab" })
vk.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = "Go to prev tab" })
vk.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = "Open current buffer in new tab" })

-- substitute
local substitute = require("substitute")
vk.set('n', 's', substitute.operator, { desc = "Substitute w/motion" })
vk.set('n', 'ss', substitute.line, { desc = "Substitute line" })
vk.set('n', 'S', substitute.eol, { desc = "Substitute to eol" })
vk.set('x', 's', substitute.visual, { desc = "Substitute in visual mode" })

-- render-markdown
local render_markdown = require('render-markdown')
render_markdown.setup({})
vk.set('n', '<leader>mt', render_markdown.buf_toggle)
vk.set('n', '<leader>mT', render_markdown.toggle)

-- telescope
vk.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = "Fuzzy find files in cwd" })
vk.set('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>', { desc = "Fuzzy find in recent files" })
vk.set('n', '<leader>fs', '<cmd>Telescope live_grep<CR>', { desc = "Fuzzy find string in cwd" })
vk.set('n', '<leader>fc', '<cmd>Telescope grep_string<CR>', { desc = "Fuzzy Find string under cursor in cwd" })

-- yank/paste
vk.set('n', '<leader>y', '"+y')
vk.set('v', '<leader>y', '"+y')
vk.set('n', '<leader>Y', '"+p')

vk.set('n', '<leader>p', '"+p')
vk.set('x', '<leader>p', '_dP')
vk.set('n', '<leader>P', '"+P')

-- system highlights
vk.set('n', '<leader>nh', '<cmd>nohl<CR>')

vim.cmd("colorscheme tokyonight-night")

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
