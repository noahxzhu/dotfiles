local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
  return
end

local dapui_ok, dapui = pcall(require, "dapui")
if not dapui_ok then
  return
end

dapui.setup()

local icons = require "core.icons"
vim.fn.sign_define("DapBreakpoint", { text = icons.ui.Bug, texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
