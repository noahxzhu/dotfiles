local Util = require "util"

return {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = function()
    local icons = require("config").icons
    local fg = Util.fg

    return {
      options = {
        theme = "auto",
        globalstatus = true,
        component_separators = {
          -- left = require("config").icons.ui.SlashSeparatorBack,
          -- right = require("config").icons.ui.SlashSeparatorForward,
        },
        section_separators = {
          -- left = require("config").icons.ui.TriangleLowerLeft,
          -- right = require("config").icons.ui.TriangleLowerRight,
        },
        disabled_filetypes = { statusline = { "NvimTree", "dashboard", "lazy", "alpha" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
          {
            "aerial",
            sep = " ", -- separator between symbols
            sep_icon = "", -- separator between icon and symbol

            -- The number of symbols to render top-down. In order to render only 'N' last
            -- symbols, negative numbers may be supplied. For instance, 'depth = -1' can
            -- be used in order to render only current symbol.
            depth = 5,

            -- When 'dense' mode is on, icons are not rendered near their symbols. Only
            -- a single icon that represents the kind of current symbol is rendered at
            -- the beginning of status line.
            dense = false,

            -- The separator to be used to separate symbols in dense mode.
            dense_sep = ".",

            -- Color the symbol icons.
            colored = true,
          },
        },
        lualine_x = {
          {
            function()
              return require("noice").api.status.command.get()
            end,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.command.has()
            end,
            color = fg "Statement",
          },
          {
            function()
              return require("noice").api.status.mode.get()
            end,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.mode.has()
            end,
            color = fg "Constant",
          },
          {
            function()
              return "  " .. require("dap").status()
            end,
            cond = function()
              return package.loaded["dap"] and require("dap").status() ~= ""
            end,
            color = fg "Debug",
          },
          { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg "Special" },
          {
            "diff",
            symbols = {
              added = icons.git.Added,
              modified = icons.git.Modified,
              removed = icons.git.Removed,
            },
          },
        },
        lualine_y = {
          { "encoding", padding = { left = 1, right = 1 } },
        },
        lualine_z = {
          { "progress", padding = { left = 1, right = 1 } },
          { "location", padding = { left = 1, right = 1 } },
        },
      },
    }
  end,
}
