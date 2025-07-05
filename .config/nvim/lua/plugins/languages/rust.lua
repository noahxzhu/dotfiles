return {
  {
    "mrcjkb/rustaceanvim",
    version = "^3",
    ft = { "rust" },
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      vim.g.rustaceanvim = function()
        return {
          tools = {
            on_initialized = function()
              vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
                pattern = { "*.rs" },
                callback = function()
                  local clients = vim.lsp.get_clients()
                  for _, client in pairs(clients) do
                    if client:supports_method "textDocument/codeLens" then
                      pcall(vim.lsp.codelens.refresh)
                      return
                    end
                  end
                end,
              })
            end,
          },
          server = {
            on_attach = require("util").on_attach(function(client, buffer)
              require("plugins.lsp.keymaps").on_attach(client, buffer)
            end),
            capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
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
      end
    end,
  },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    opts = {
      popup = {
        autofocus = true,
        -- border = "rounded",
      },
      src = {
        cmp = {
          enabled = true,
        },
      },
    },
    config = function(_, opts)
      require("crates").setup(opts)
      -- nvim-cmp must be loaded before crates, otherwise we need to register it manually
      require("crates.src.cmp").setup()
    end,
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "rouge8/neotest-rust",
    },
    opts = {
      adapters = {
        ["neotest-rust"] = {},
      },
    },
  },
}
