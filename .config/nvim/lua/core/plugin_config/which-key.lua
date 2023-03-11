local ok, which_key = pcall(require, "which-key")
if not ok then
  return
end

local opts = {
  prefix = "<leader>",
}

local mappings = {}

mappings["d"] = {
  name = "Debug",
  b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
  bc = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<cr>", "Breakpoint Condition" },
  bm = {
    "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log Point Message: '))<cr>",
    "Breakpoint Message",
  },
  c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
  i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
  l = { "<cmd>lua require'dap'.run_last()<cr>", "Run the Last" },
  O = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
  o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
  r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
  u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
  x = { "<cmd>lua require'dap'.terminate()<cr>", "Stop" },
}

mappings["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" }

mappings["f"] = {
  name = "Find",
  b = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
  C = { "<cmd>Telescope commands<cr>", "Commands" },
  c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
  f = { "<cmd>Telescope find_files<cr>", "Find files" },
  H = { "<cmd>Telescope highlights<cr>", "Highlights" },
  h = { "<cmd>Telescope help_tags<cr>", "Help" },
  -- i = { "<cmd>Telescope media_files<cr>", "Media" },
  k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  l = { "<cmd>Telescope resume<cr>", "Last Search" },
  M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
  p = { "<cmd>Telescope projects<cr>", "Find Projects" },
  R = { "<cmd>Telescope registers<cr>", "Registers" },
  r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
  s = { "<cmd>Telescope grep_string<cr>", "Find String" },
  t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
}

mappings["g"] = {
  name = "Git",
  b = { "<cmd>Telescope git_branches<cr>", "Checkout Branch" },
  C = {
    "<cmd>Telescope git_bcommits<cr>",
    "Checkout Commit(for Current File)",
  },
  c = { "<cmd>Telescope git_commits<cr>", "Checkout Commit" },
  d = {
    "<cmd>Gitsigns diffthis HEAD<cr>",
    "Git Diff",
  },
  g = { "<cmd>lua require'core.plugin_config.toggleterm'.lazygit_toggle()<cr>", "Lazygit" },
  j = { "<cmd>lua require'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
  k = { "<cmd>lua require'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
  l = { "<cmd>lua require'gitsigns'.blame_line()<cr>", "Blame" },
  o = { "<cmd>Telescope git_status<cr>", "Open Changed File" },
  p = { "<cmd>lua require'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
  R = { "<cmd>lua require'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
  r = { "<cmd>lua require'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
  s = { "<cmd>lua require'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
  t = { "<cmd>lua require'gitsigns'.toggle_current_line_blame()<cr>", "Toggle Current Line Blame" },
  u = {
    "<cmd>lua require'gitsigns'.undo_stage_hunk()<cr>",
    "Undo Stage Hunk",
  },
}

mappings["l"] = {
  name = "LSP",
  a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
  f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
  i = { "<cmd>LspInfo<cr>", "Info" },
  j = {
    "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>",
    "Next Diagnostic",
  },
  k = {
    "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
    "Prev Diagnostic",
  },
}

mappings["p"] = {
  name = "Packer",
  s = { "<cmd>PackerSync<cr>", "Packer Sync" },
}

which_key.register(mappings, opts)
