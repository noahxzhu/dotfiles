return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        config = function()
          local dap = require "dap"
          local dapui = require "dapui"
          dapui.setup()
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open {}
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close {}
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close {}
          end
        end,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        config = true,
      },
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
        "<leader>dC",
        "<cmd>lua require'dap'.run_to_cursor()<cr>",
        desc = "Run to Cursor",
      },
      {
        "<leader>dc",
        "<cmd>lua require'dap'.continue()<cr>",
        desc = "Continue",
      },
      {
        "<leader>dg",
        "<cmd>lua require'dap'.goto_()<cr>",
        desc = "Go to Line (no execute)",
      },
      {
        "<leader>di",
        "<cmd>lua require'dap'.step_into()<cr>",
        desc = "Step Into",
      },
      {
        "<leader>dj",
        "<cmd>lua require'dap'.down()<cr>",
        desc = "Step Into",
      },
      {
        "<leader>dk",
        "<cmd>lua require'dap'.up()<cr>",
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
        "<leader>dp",
        "<cmd>lua require'dap'.pause()<cr>",
        desc = "Pause",
      },
      {
        "<leader>dr",
        "<cmd>lua require'dap'.repl.toggle()<cr>",
        desc = "Repl",
      },
      {
        "<leader>ds",
        "<cmd>lua require'dap'.session()<cr>",
        desc = "Session",
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
      {
        "<leader>dw",
        "<cmd>lua require'dap.ui.widgets'.hover()<cr>",
        desc = "Widgets",
      },
    },
    config = function()
      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

      for name, sign in pairs(require("config").icons.dap) do
        sign = type(sign) == "table" and sign or { sign }
        vim.fn.sign_define(
          "Dap" .. name,
          { text = sign[1], texthl = sign[2] or "DiagnosticSignInfo", linehl = sign[3], numhl = sign[3] }
        )
      end
    end,
  },
}
