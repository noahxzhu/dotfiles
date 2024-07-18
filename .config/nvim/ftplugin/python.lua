local wk = require "which-key"

wk.add {
  {
    mode = { "n" },
    { "<leader>C", group = "Python" },
    { "<leader>Cd", "<cmd>lua require('dap-python').debug_selection()<cr>", desc = "Debug Selection" },
    { "<leader>CT", "<cmd>lua require('dap-python').test_class()<cr>", desc = "Test Class" },
    { "<leader>Ct", "<cmd>lua require('dap-python').test_method()<cr>", desc = "Test Method" },
  },
}
