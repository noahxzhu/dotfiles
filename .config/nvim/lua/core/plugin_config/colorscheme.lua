local colorscheme = "catppuccin-mocha"
-- local colorscheme = "terafox"
-- local colorscheme = "kanagawa"
-- local colorscheme = "nord"

local ok = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
  return
end
