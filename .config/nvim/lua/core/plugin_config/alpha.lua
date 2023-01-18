local ok, alpha = pcall(require, "alpha")
if not ok then
  return
end

local dashboard = require "alpha.themes.dashboard"

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl_shortcut = "Macro"
  return b
end

local icons = require "core.icons"
local logos = require "core.logos"

dashboard.section.header.val = logos[8]

dashboard.section.buttons.val = {
  button("f", icons.ui.FindFile .. " Find file", "<cmd>Telescope find_files<cr>"),
  button("n", icons.ui.NewFile .. " New file", "<cmd>ene!<cr>"),
  button("p", icons.git.Repo .. " Find project", "<cmd>lua require('telescope').extensions.projects.projects()<cr>"),
  button("r", icons.ui.History .. " Recent files", "<cmd>Telescope oldfiles<cr>"),
  button("t", icons.ui.List .. " Find text", "<cmd>Telescope live_grep<cr>"),
  button("c", icons.ui.Gear .. " Config", "<cmd>e ~/.config/nvim<cr>"),
  button("q", icons.ui.SignOut .. " Quit", "<cmd>qa<cr>"),
}

local function footer()
  return "I Love Neovim 﫵"
end

dashboard.section.footer.val = footer()

dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Macro"
dashboard.section.footer.opts.hl = "Type"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
