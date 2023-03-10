local ok, lualine = pcall(require, "lualine")
if not ok then
  return
end

local function separator()
  return "%="
end

local function lsp_client(msg)
  msg = msg or ""
  local buf_clients = vim.lsp.buf_get_clients()
  if next(buf_clients) == nil then
    if type(msg) == "boolean" or #msg == 0 then
      return ""
    end
    return msg
  end

  local buf_ft = vim.bo.filetype

  local buf_client_names = {}

  -- add client
  for _, client in pairs(buf_clients) do
    if client.name ~= "null-ls" then
      table.insert(buf_client_names, client.name)
    end
  end

  -- add formatter
  local formatters = require "core.plugin_config.lsp.null-ls.formatters"
  local supported_formatters = formatters.list_registered(buf_ft)
  vim.list_extend(buf_client_names, supported_formatters)

  -- add linter
  local linters = require "core.plugin_config.lsp.null-ls.linters"
  local supported_linters = linters.list_registered(buf_ft)
  vim.list_extend(buf_client_names, supported_linters)

  -- add hover
  local hovers = require "core.plugin_config.lsp.null-ls.hovers"
  local supported_hovers = hovers.list_registered(buf_ft)
  vim.list_extend(buf_client_names, supported_hovers)

  -- add code action
  local code_actions = require "core.plugin_config.lsp.null-ls.code_actions"
  local supported_code_actions = code_actions.list_registered(buf_ft)
  vim.list_extend(buf_client_names, supported_code_actions)

  return "[" .. table.concat(buf_client_names, ", ") .. "]"
end

local navic = require "nvim-navic"
local colors = require "core.colors"
local icons = require "core.icons"

lualine.setup {
  options = {
    icons_enabled = true,
    globalstatus = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "NvimTree", "alpha", "packer" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      "branch",
      "diff",
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = {
          error = icons.diagnostics.BoldError,
          warn = icons.diagnostics.BoldWarning,
          info = icons.diagnostics.BoldInformation,
          hint = icons.diagnostics.BoldHint,
        },
        colored = false,
      },
    },
    lualine_c = {
      { separator },
      {
        lsp_client,
        icon = icons.ui.Gears,
        color = { fg = colors.violet, gui = "bold" },
        on_click = function()
          vim.cmd [[LspInfo]]
        end,
      },
      {
        navic.get_location,
        cond = navic.is_available,
        color = { fg = colors.green },
      },
    },
    lualine_x = { "filename", "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}
