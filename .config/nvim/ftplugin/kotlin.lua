vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.cmdheight = 2 -- more space in the neovim command line for displaying messages

local ok, dap = pcall(require, "dap")
if not ok then
  return
end

local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")

dap.adapters.kotlin = {
  type = "executable",
  command = mason_path .. "bin/kotlin-debug-adapter",
  args = { "--interpreter=vscode" },
}

dap.configurations.kotlin = {
  {
    type = "kotlin",
    name = "launch - kotlin",
    request = "launch",
    projectRoot = vim.fn.getcwd() .. "/app",
    mainClass = function()
      return vim.fn.input("Path to main class: ", "", "file")
    end,
  },
}
