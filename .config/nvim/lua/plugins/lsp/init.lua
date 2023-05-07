local opts_servers = require "plugins.lsp.opts"

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      {
        "hrsh7th/cmp-nvim-lsp",
        cond = function()
          return require("util").has "nvim-cmp"
        end,
      },
    },
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          -- prefix = "icons",
        },
        severity_sort = true,
      },
      -- Automatically format on save
      autoformat = true,
      -- options for vim.lsp.buf.format
      -- `bufnr` and `filter` is handled by the LazyVim formatter,
      -- but can be also overridden when specified
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      -- LSP Server Settings
      servers = opts_servers,
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
    },
    config = function(_, opts)
      -- setup autoformat
      require("plugins.lsp.format").autoformat = opts.autoformat
      -- setup formatting and keymaps
      require("util").on_attach(function(client, buffer)
        require("plugins.lsp.format").on_attach(client, buffer)
        require("plugins.lsp.keymaps").on_attach(client, buffer)
      end)

      -- diagnostics
      for name, icon in pairs(require("config").icons.diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end

      if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
        opts.diagnostics.virtual_text.prefix = function(diagnostic)
          local icons = require("config").icons.diagnostics
          for d, icon in pairs(icons) do
            if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
              return icon
            end
          end
        end
      end

      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      local servers = opts.servers
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      local setup = function(server)
        if servers[server] ~= nil and servers[server].skip_setup then
          return
        end

        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        require("lspconfig")[server].setup(server_opts)
      end

      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      local all_mslp_servers = {}
      if have_mason then
        all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
      end

      local ensure_installed = {}
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
          if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      if have_mason then
        mlsp.setup { ensure_installed = ensure_installed }
        mlsp.setup_handlers { setup }
      end
    end,
  },

  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim" },
    opts = function()
      local nls = require "null-ls"
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          -- code actions
          -- nls.builtins.code_actions.gitsigns,
          -- nls.builtins.code_actions.shellcheck,

          -- completion
          nls.builtins.completion.spell,

          -- diagnostics
          nls.builtins.diagnostics.checkmake,
          nls.builtins.diagnostics.codespell.with {
            extra_args = { "--config", vim.fn.stdpath "config" .. "/.codespellrc" },
          },
          nls.builtins.diagnostics.flake8,
          nls.builtins.diagnostics.markdownlint,
          -- nls.builtins.diagnostics.shellcheck,
          nls.builtins.diagnostics.staticcheck,
          nls.builtins.diagnostics.tsc,
          nls.builtins.diagnostics.zsh,

          -- formatting
          nls.builtins.formatting.black,
          nls.builtins.formatting.dprint,
          nls.builtins.formatting.gofmt,
          nls.builtins.formatting.goimports,
          nls.builtins.formatting.google_java_format,
          nls.builtins.formatting.isort,
          nls.builtins.formatting.jq,
          nls.builtins.formatting.prettier,
          nls.builtins.formatting.rustfmt.with {
            extra_args = function(params)
              local Path = require "plenary.path"
              local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

              if cargo_toml:exists() and cargo_toml:is_file() then
                for _, line in ipairs(cargo_toml:readlines()) do
                  local edition = line:match [[^edition%s*=%s*%"(%d+)%"]]
                  if edition then
                    return { "--edition=" .. edition }
                  end
                end
              end
              -- default edition when we don't find `Cargo.toml` or the `edition` in it.
              return { "--edition=2021" }
            end,
          },
          nls.builtins.formatting.stylua,

          -- hover
          nls.builtins.hover.dictionary,
        },
      }
    end,
  },

  -- cmdline tools and lsp servers
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>lm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        "flake8",
      },
    },
    ---@param opts MasonSettings | {ensure_installed: string[]}
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require "mason-registry"
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
}
