local Util = require "util"

return {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = function()
    local icons = require("config").icons
    local fg = Util.fg

    local spaces = function()
      local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
      return icons.ui.Tab .. " " .. shiftwidth
    end

    local lsp = function()
      local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }

      local buf_client_names = {}

      for _, client in pairs(buf_clients) do
        table.insert(buf_client_names, client.name)
      end

      local formatters = require("conform").list_formatters()
      for _, formatter in ipairs(formatters) do
        if formatter.available then
          table.insert(buf_client_names, formatter.name)
        end
      end

      local linters = require("lint").get_running()
      for _, linter in ipairs(linters) do
        table.insert(buf_client_names, linter)
      end

      if #buf_client_names == 0 then
        return icons.ui.Gears .. " LSP Inactive"
      end

      local unique_client_names = table.concat(buf_client_names, ", ")

      return icons.ui.Gears .. " " .. unique_client_names
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
        lualine_a = { { "mode", padding = { left = 1, right = 1 } } },
        lualine_b = { { "branch", padding = { left = 1, right = 1 } } },
        lualine_c = {
          {
            "diff",
            symbols = {
              added = icons.git.Added,
              modified = icons.git.Modified,
              removed = icons.git.Removed,
            },
            padding = { left = 1, right = 1 },
          },
        },
        lualine_x = {
          {
            function()
              return "  " .. require("dap").status()
            end,
            cond = function()
              return package.loaded["dap"] and require("dap").status() ~= ""
            end,
            color = fg "Debug",
            padding = { left = 1, right = 1 },
          },
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
            padding = { left = 1, right = 1 },
          },
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = fg "Special",
            padding = { left = 1, right = 1 },
          },
          { lsp, padding = { left = 1, right = 1 } },
          { spaces, padding = { left = 1, right = 1 } },
          { "encoding", fmt = string.upper, padding = { left = 1, right = 1 } },
          { "filetype", padding = { left = 1, right = 2 } },
        },
        lualine_y = {
          { "location", padding = { left = 1, right = 1 } },
        },
        lualine_z = {
          { "progress", padding = { left = 1, right = 1 } },
        },
      },
    }
  end,
}
