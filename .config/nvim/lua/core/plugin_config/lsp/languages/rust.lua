local ok, rust_tools = pcall(require, "rust-tools")
if not ok then
  return
end

local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
local codelldb_adapter = {
  type = "server",
  port = "${port}",
  executable = {
    command = mason_path .. "bin/codelldb",
    args = { "--port", "${port}" },
  },
}

local opts = {
  tools = {
    on_initialized = function()
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
        pattern = { "*.rs" },
        callback = function()
          pcall(vim.lsp.codelens.refresh)
        end,
      })
    end,
  },
  dap = {
    adapter = codelldb_adapter,
  },
  server = {
    on_attach = require("core.plugin_config.lsp.handlers").on_attach,
    capabilities = require("core.plugin_config.lsp.handlers").capabilities,
    settings = {
      ["rust-analyzer"] = {
        lens = {
          enable = true,
        },
        checkOnSave = {
          enable = true,
          command = "clippy",
        },
      },
    },
  },
}

rust_tools.setup(opts)
