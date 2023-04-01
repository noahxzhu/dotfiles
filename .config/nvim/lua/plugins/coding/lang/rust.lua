return {
  {
    "simrat39/rust-tools.nvim",
    lazy = true,
    ft = { "rust" },
    dependencies = {
      "rust-lang/rust.vim",
    },
    config = function()
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
          on_attach = require("util").on_attach(function(client, buffer)
            require("plugins.lsp.format").on_attach(client, buffer)
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

      require("rust-tools").setup(opts)
    end,
  },
  {
    "rust-lang/rust.vim",
    lazy = true,
  },
  {
    "saecki/crates.nvim",
    lazy = true,
    tag = "v0.3.0",
    event = { "BufRead Cargo.toml" },
    opts = {
      null_ls = {
        enabled = true,
        name = "crates.nvim",
      },
    },
  },
}
