M = {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    -- char = "▏",
    char = "│",
    filetype_exclude = { "help", "alpha", "dashboard", "NvimTree", "Trouble", "lazy" },
    show_trailing_blankline_indent = false,
    show_current_context = false,
  },
}

return M
