local wk = require "which-key"

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  C = {
    name = "Go",
    A = { "<cmd>GoTestsAll<cr>", "Add All Tests" },
    a = { "<cmd>GoTestAdd<cr>", "Add Test" },
    c = { "<cmd>GoCmt<cr>", "Generate Comment" },
    e = { "<cmd>GoTestsExp<cr>", "Add Exported Tests" },
    f = { "<cmd>GoMod tidy<cr>", "Tidy" },
    G = { "<cmd>GoGenerate %<cr>", "Go Generate File" },
    g = { "<cmd>GoGenerate<cr>", "Go Generate" },
    i = { "<cmd>GoInstallDeps<cr>", "Install Go Dependencies" },
    t = { "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Test" },
  },
}

wk.register(mappings, opts)
