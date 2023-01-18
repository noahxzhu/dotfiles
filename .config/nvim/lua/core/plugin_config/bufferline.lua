local ok, bufferline = pcall(require, "bufferline")
if not ok then
  return
end

local nord_ok, nord = pcall(require, "nord")
if not nord_ok then
  return
end

local highlights = nord.bufferline.highlights {
  italic = true,
  bold = true,
}

bufferline.setup {
  options = {
    separator_style = "thin",
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "PanelHeading",
        padding = 1,
      },
      {
        filetype = "packer",
        text = "Packer",
        highlight = "PanelHeading",
        padding = 1,
      },
    },
    highlights = highlights,
    -- always_show_bufferline = false,
  },
}
