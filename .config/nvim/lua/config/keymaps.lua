vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = function(mode, lhs, rhs, opts)
  opts = vim.tbl_deep_extend("force", { silent = true }, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Normal --
-- Better windows navigation
keymap("n", "<c-h>", "<c-w>h", { desc = "Move to the left window" })
keymap("n", "<c-j>", "<c-w>j", { desc = "Move to the below window" })
keymap("n", "<c-k>", "<c-w>k", { desc = "Move to the above window" })
keymap("n", "<c-l>", "<c-w>l", { desc = "Move to the right window" })

-- Resize with arrows
keymap("n", "<a-up>", "<cmd>resize -2<cr>", { desc = "Decrease the window height" })
keymap("n", "<a-down>", "<cmd>resize +2<cr>", { desc = "Increase the window height" })
keymap("n", "<a-left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease the window width" })
keymap("n", "<a-right>", "<cmd>vertical resize +2<cr>", { desc = "Increase the window width" })

-- Navigate buffers
keymap("n", "<s-l>", "<cmd>bnext<cr>", { desc = "Move to the next buffer" })
keymap("n", "<s-h>", "<cmd>bprevious<cr>", { desc = "Move to the prev buffer" })

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", { desc = "Decrease the indent" })
keymap("v", ">", ">gv", { desc = "Increase the indent" })
