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
  i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
  k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  l = { "<cmd>Telescope resume<cr>", "Last Search" },
  M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
  p = { "<cmd>Telescope projects<cr>", "Find Projects" },
  R = { "<cmd>Telescope registers<cr>", "Rjgisters" },
  r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
  s = { "<cmd>Telescope grep_string<cr>", "Find String" },
  t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
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
