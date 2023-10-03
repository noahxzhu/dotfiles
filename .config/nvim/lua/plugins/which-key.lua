return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
  },
  config = function(_, opts)
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    local wk = require "which-key"
    wk.setup(opts)
    local keymaps = {
      mode = { "n", "v" },
      ["g"] = { desc = "+Goto" },
      ["]"] = { desc = "+Next" },
      ["["] = { desc = "+Prev" },
      ["<leader><tab>"] = { desc = "+Tabs" },
      ["<leader>c"] = { desc = "+Code" },
      ["<leader>d"] = { desc = "+DAP" },
      ["<leader>da"] = { desc = "+Advanced BP" },
      ["<leader>f"] = { desc = "+File/Find" },
      ["<leader>g"] = { desc = "+Git" },
      ["<leader>gh"] = { desc = "+Hunks" },
      ["<leader>h"] = { desc = "+Harpoon" },
      ["<leader>l"] = { desc = "+LSP" },
      ["<leader>u"] = { desc = "+UI" },
      ["<leader>w"] = { desc = "+Windows" },
      ["<leader>x"] = { desc = "+Diagnostics/Quickfix" },
    }
    wk.register(keymaps)
  end,
}
