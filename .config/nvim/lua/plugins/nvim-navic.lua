return {
  "SmiteshP/nvim-navic",
  init = function()
    vim.g.navic_silence = true
    require("util").on_attach(function(client, buffer)
      if client.server_capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, buffer)
      end
    end)
  end,
  opts = function()
    return {
      separator = " ",
      highlight = true,
      depth_limit = 5,
      icons = require("config").icons.kinds,
    }
  end,
}
