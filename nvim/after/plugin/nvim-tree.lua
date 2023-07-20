-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup()

local api = require("nvim-tree.api")

vim.keymap.set("n", "<C-p>", [[:NvimTreeToggle<CR>]])
vim.keymap.set("n", "<leader>nf", function() api.tree.find_file({ open = true }) end)
