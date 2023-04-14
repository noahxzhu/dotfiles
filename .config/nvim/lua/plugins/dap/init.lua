local Util = require "util"

local M = {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
    keys = {
      {
        "<leader>dac",
        "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<cr>",
        desc = "Breakpoint Condition",
      },
      {
        "<leader>dam",
        "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log Point Message: '))<cr>",
        desc = "Breakpoint Message",
      },
      {
        "<leader>db",
        "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
        desc = "Breakpoint",
      },
      {
        "<leader>dc",
        "<cmd>lua require'dap'.continue()<cr>",
        desc = "Continue",
      },
      {
        "<leader>di",
        "<cmd>lua require'dap'.step_into()<cr>",
        desc = "Step Into",
      },
      {
        "<leader>dl",
        "<cmd>lua require'dap'.run_last()<cr>",
        desc = "Run the Last",
      },
      {
        "<leader>dO",
        "<cmd>lua require'dap'.step_out()<cr>",
        desc = "Step Out",
      },
      {
        "<leader>do",
        "<cmd>lua require'dap'.step_over()<cr>",
        desc = "Step Over",
      },
      {
        "<leader>dr",
        "<cmd>lua require'dap'.repl.toggle()<cr>",
        desc = "Repl",
      },
      {
        "<leader>du",
        "<cmd>lua require'dapui'.toggle()<cr>",
        desc = "UI",
      },
      {
        "<leader>dx",
        "<cmd>lua require'dap'.terminate()<cr>",
        desc = "Stop",
      },
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    config = function()
      require("dapui").setup()
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = true,
    config = true,
  },
}

return Util.merge(M, require "plugins.dap.lang")
