return {
  {
    "leoluz/nvim-dap-go",
    lazy = true,
    event = { "BufEnter *.go" },
    dependencies = {
      "olexsmir/gopher.nvim",
    },
    config = function()
      require("gopher.dap").setup()
      require("dap-go").setup()
    end,
  },
}
