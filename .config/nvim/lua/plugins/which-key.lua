return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    local wk = require "which-key"
    wk.add {
      {
        mode = { "n", "v" },
        { "g", group = "+Goto" },
        { "]", group = "+Next" },
        { "[", group = "+Prev" },
        { "<leader><tab>", group = "+Tabs" },
        { "<leader>c", group = "+Code" },
        { "<leader>d", group = "+DAP" },
        { "<leader>da", group = "+Advanced BP" },
        { "<leader>f", group = "+File/Find" },
        { "<leader>g", group = "+Git" },
        { "<leader>gh", group = "+Hunks" },
        { "<leader>h", group = "+Harpoon" },
        { "<leader>l", group = "+LSP" },
        { "<leader>n", group = "+Swap Next" },
        { "<leader>p", group = "+Swap Previous" },
        { "<leader>t", group = "+Test" },
        { "<leader>u", group = "+UI" },
        { "<leader>w", group = "+Windows" },
        { "<leader>x", group = "+Diagnostics/Quickfix" },
      },
    }
  end,
}
