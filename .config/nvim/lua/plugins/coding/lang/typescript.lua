return {
  {
    "jose-elias-alvarez/typescript.nvim",
    lazy = true,
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      local opts = {
        disable_commands = false, -- prevent the plugin from creating Vim commands
        debug = false, -- enable debug logging for commands
        go_to_source_definition = {
          fallback = true, -- fall back to standard LSP definition on failure
        },
        server = { -- pass options to lspconfig's setup method
          on_attach = require("util").on_attach(function(client, buffer)
            require("plugins.lsp.format").on_attach(client, buffer)
            require("plugins.lsp.keymaps").on_attach(client, buffer)
          end),
          capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
          settings = {
            typescript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = false,
                includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
              },
            },
          },
        },
      }

      require("typescript").setup(opts)
    end,
  },
}
