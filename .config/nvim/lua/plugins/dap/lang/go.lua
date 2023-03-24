return {
  {
    "leoluz/nvim-dap-go",
    lazy = true,
    dependencies = {
      "mfussenegger/nvim-dap",
      "olexsmir/gopher.nvim",
    },
    ft = { "go" },
    config = function()
      require("gopher.dap").setup()
      require("dap-go").setup()
    end,
  },
}
