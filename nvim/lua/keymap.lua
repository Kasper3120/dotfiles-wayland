local vk = vim.keymap
vk.set('n', '<leader>lf', vim.lsp.buf.format, { desc = "Format buffer" })
vk.set('n', '<leader>o', '<cmd>update<CR>,<cmd>source<CR>', { desc = "Source file" })
vk.set('n', '<leader>w', '<cmd>write<CR>', { desc = "Save" })
vk.set('n', '<leader>q', '<cmd>quit<CR>', { desc = "Quit" })
vk.set('n', '<leader>e', '<cmd>Oil<CR>', { desc = "Open Oil (dir browsing)" })
vk.set('n', '<leader>lg', '<cmd>LazyGit<CR>', { desc = "LazyGit" })

-- sed
vk.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { noremap = true, silent = false, desc="Sed word" })
vk.set('v', '<leader>s', [["sy: '<,'>s/<C-r>s/<C-r>s/gI<Left><Left><Left>]], { noremap = true, silent = false, desc="Sed highlight (WIP)"})


-- tabs
vk.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = "Open new tab" })
vk.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = "Close tab" })
vk.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = "Go to next tab" })
vk.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = "Go to prev tab" })
vk.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = "Open current buffer in new tab" })

-- splits
vk.set('n', '<leader>h', '<cmd>split<CR>', { desc = "Horizontal split" })
vk.set('n', '<leader>v', '<cmd>vsplit<CR>', { desc = "Vertical split" })

-- substitute
local substitute = require("substitute")
vk.set('n', 's', substitute.operator, { desc = "Substitute w/motion" })
vk.set('n', 'ss', substitute.line, { desc = "Substitute line" })
vk.set('n', 'S', substitute.eol, { desc = "Substitute to eol" })
vk.set('x', 's', substitute.visual, { desc = "Substitute in visual mode" })

-- render-markdown
local render_markdown = require('render-markdown')
render_markdown.setup({})
vk.set('n', '<leader>mt', render_markdown.buf_toggle, { desc = "Toggle md rendering (buf)"})
vk.set('n', '<leader>mT', render_markdown.toggle, { desc = "Toggle md rendering (glob)"})

-- telescope
vk.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = "Fuzzy find files in cwd" })
vk.set('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>', { desc = "Fuzzy find in recent files" })
vk.set('n', '<leader>fs', '<cmd>Telescope live_grep<CR>', { desc = "Fuzzy find string in cwd" })
vk.set('n', '<leader>fc', '<cmd>Telescope grep_string<CR>', { desc = "Fuzzy Find string under cursor in cwd" })

-- yank/paste
vk.set('n', '<leader>y', '"+y', { desc = "Yank to \"+"})
vk.set('v', '<leader>y', '"+y', { desc = "Yank to \"+"})
vk.set('n', '<leader>Y', '"+Y', { desc = "Yank to \"+ (until EOL)"})

vk.set('n', '<leader>p', '"+p', { desc = "Paste from \"+"})
vk.set('v', '<leader>p', '_dP', { desc = "Paste from \"+"})
vk.set('n', '<leader>P', '"+P', { desc = "Paste from \"+ (before cursor)"})

-- system highlights
vk.set('n', '<leader>nh', '<cmd>nohl<CR>', { desc = "clear highlights"})
