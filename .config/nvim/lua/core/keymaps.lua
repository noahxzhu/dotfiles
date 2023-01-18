local opts = { silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Normal --
-- Better windows navigation
vim.keymap.set("n", "<c-h>", "<c-w>h", opts)
vim.keymap.set("n", "<c-j>", "<c-w>j", opts)
vim.keymap.set("n", "<c-k>", "<c-w>k", opts)
vim.keymap.set("n", "<c-l>", "<c-w>l", opts)

-- Resize with arrows
vim.keymap.set("n", "<a-up>", "<cmd>resize -2<cr>", opts)
vim.keymap.set("n", "<a-down>", "<cmd>resize +2<cr>", opts)
vim.keymap.set("n", "<a-left>", "<cmd>vertical resize -2<cr>", opts)
vim.keymap.set("n", "<a-right>", "<cmd>vertical resize +2<cr>", opts)

-- Navigate buffers
vim.keymap.set("n", "<s-l>", "<cmd>bnext<cr>", opts)
vim.keymap.set("n", "<s-h>", "<cmd>bprevious<cr>", opts)

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- NvimTree
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
vim.keymap.set("n", "<leader>ft", "<cmd>Telescope live_grep<cr>", opts)
vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>", opts)
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)

-- Packer
vim.keymap.set("n", "<leader>ps", "<cmd>PackerSync<cr>", opts)
