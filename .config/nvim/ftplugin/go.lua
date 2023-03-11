local ok, which_key = pcall(require, "which-key")
if not ok then
  return
end

local opts = {
  prefix = "<leader>",
}

local mappings = {
  C = {
    name = "Go",
    A = { "<cmd>GoTestsAll<Cr>", "Add All Tests" },
    a = { "<cmd>GoTestAdd<Cr>", "Add Test" },
    c = { "<cmd>GoCmt<Cr>", "Generate Comment" },
    e = { "<cmd>GoTestsExp<Cr>", "Add Exported Tests" },
    f = { "<cmd>GoMod tidy<cr>", "Tidy" },
    G = { "<cmd>GoGenerate %<Cr>", "Go Generate File" },
    g = { "<cmd>GoGenerate<Cr>", "Go Generate" },
    i = { "<cmd>GoInstallDeps<Cr>", "Install Go Dependencies" },
    t = { "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Test" },
  },
}

which_key.register(mappings, opts)
