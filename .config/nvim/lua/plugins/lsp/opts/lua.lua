local M = {}

M.lua_ls = {
  -- mason = false, -- set to false if you don't want this server to be installed with mason
  settings = {
    Lua = {
      format = {
        enable = false,
        -- Put format options here
        -- NOTE: the value should be STRING!!
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
          quote_style = "double",
          continuation_indent = "2",
          call_arg_parentheses = "remove",
        },
      },
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
        disable = { "missing-parameter" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

return M
