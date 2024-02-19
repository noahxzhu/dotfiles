return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  opts = function()
    local dashboard = require "alpha.themes.dashboard"
    local logo = {
      [[                                                    ]],
      [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
      [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
      [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
      [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
      [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
      [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
      [[                                                    ]],
    }
    dashboard.section.header.val = logo
    dashboard.section.buttons.val = {
      dashboard.button("f", require("config").icons.ui.FindFile .. " Find file", "<cmd>Telescope find_files<cr>"),
      dashboard.button("n", require("config").icons.ui.NewFile .. " New file", "<cmd>ene!<cr>"),
      dashboard.button("p", require("config").icons.git.Repo .. " Find project", "<cmd>Telescope projects<cr>"),
      dashboard.button("o", require("config").icons.ui.Obsidian .. " Obsidian", "<cmd>e $OBSIDIAN_VAULT_NOAH<cr>"),
      dashboard.button("r", require("config").icons.ui.History .. " Recent files", "<cmd>Telescope oldfiles<cr>"),
      dashboard.button("t", require("config").icons.ui.List .. " Find text", "<cmd>Telescope live_grep<cr>"),
      dashboard.button("c", require("config").icons.ui.Gear .. " Config", "<cmd>e $MYVIMRC<cr>"),
      dashboard.button("l", require("config").icons.ui.Lazy .. " Lazy", "<cmd>Lazy<cr>"),
      dashboard.button("q", require("config").icons.ui.SignOut .. " Quit", "<cmd>qa<cr>"),
    }
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end
    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.opts.layout[1].val = 8
    return dashboard
  end,
  config = function(_, dashboard)
    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    require("alpha").setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
