M = {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = function()
    local icons = require("config").icons

    local function fg(name)
      return function()
        ---@type {foreground?:number}?
        local hl = vim.api.nvim_get_hl_by_name(name, true)
        return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
      end
    end

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
            -- stylua: ignore
            {
              function() return require("nvim-navic").get_location() end,
              cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
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
          { "progress", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
      },
    }
  end,
}

return M
