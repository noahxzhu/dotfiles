local gopher_dap_ok, gopher_dap = pcall(require, "gopher.dap")
if not gopher_dap_ok then
  return
end

gopher_dap.setup()

local dap_ok, dapgo = pcall(require, "dap-go")
if not dap_ok then
  return
end

dapgo.setup()
