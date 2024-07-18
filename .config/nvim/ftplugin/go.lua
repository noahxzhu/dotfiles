local wk = require "which-key"

wk.add {
  {
    mode = { "n" },
    { "<leader>C", group = "Go" },
    { "<leader>CA", "<cmd>GoTestsAll<cr>", desc = "Add All Tests" },
    { "<leader>Ca", "<cmd>GoTestAdd<cr>", desc = "Add Test" },
    { "<leader>Cc", "<cmd>GoCmt<cr>", desc = "Generate Comment" },
    { "<leader>Ce", "<cmd>GoTestsExp<cr>", desc = "Add Exported Tests" },
    { "<leader>Cf", "<cmd>GoMod tidy<cr>", desc = "Tidy" },
    { "<leader>CG", "<cmd>GoGenerate %<cr>", desc = "Go Generate File" },
    { "<leader>Cg", "<cmd>GoGenerate<cr>", desc = "Go Generate" },
    { "<leader>Ci", "<cmd>GoInstallDeps<cr>", desc = "Install Go Dependencies" },
    { "<leader>Ct", "<cmd>lua require('dap-go').debug_test()<cr>", desc = "Debug Test" },
  },
}
