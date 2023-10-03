return {
  "akinsho/bufferline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  lazy = true,
  version = "v3.*",
  opts = {
    options = {
      separator_style = "thin",
      diagnostics = "nvim_lsp",
      offsets = {
        -- {
        --   filetype = "NvimTree",
        --   text = "File Explorer",
        --   highlight = "Directory",
        -- },
      },
    },
  },
}
