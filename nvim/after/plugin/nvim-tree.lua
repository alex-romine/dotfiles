-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup()

-- Open nvim-tree
vim.keymap.set("n", "<C-p>", [[:NvimTreeToggle<CR>]])

-- Reveal current file
vim.keymap.set("n", "<leader>tff", [[:NvimTreeFindFile<CR>]])
