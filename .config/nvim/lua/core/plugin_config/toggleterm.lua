local M = {}

local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
  return
end

toggleterm.setup {
  direction = "float",
  open_mapping = [[<c-\>]],
}

M.lazygit_toggle = function()
  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new {
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    float_opts = {
      border = "none",
      width = 100000,
      height = 100000,
    },
    on_open = function()
      vim.cmd "startinsert!"
    end,
    on_close = function() end,
    count = 99,
  }
  lazygit:toggle()
end

return M
