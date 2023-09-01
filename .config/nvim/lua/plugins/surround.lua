M = {
  "kylechui/nvim-surround",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("nvim-surround").setup()
  end,
}

return M
