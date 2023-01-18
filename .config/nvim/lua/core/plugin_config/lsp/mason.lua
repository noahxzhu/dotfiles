local ok, mason = pcall(require, "mason")
if not ok then
  return
end

local ml_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ml_ok then
  return
end

local ensure_installed_servers = {
  "bashls",
  "cssls",
  "cssmodules_ls",
  "eslint",
  "golangci_lint_ls",
  "gopls",
  "gradle_ls",
  "graphql",
  "html",
  "jsonls",
  "jdtls",
  "lua_ls",
  "pyright",
  "tailwindcss",
  "tsserver",
  "rust_analyzer",
  "yamlls",
}

local skipped_servers = {
  "tsserver",
  "rust_analyzer",
}

mason.setup()
mason_lspconfig.setup {
  ensure_installed = ensure_installed_servers,
  automatic_installation = true,
}

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

local function should_skip(server_name)
  -- ensure_installed_servers should take priority over skipped_servers
  return vim.tbl_contains(skipped_servers, server_name) and not vim.tbl_contains(ensure_installed_servers, server_name)
end

local opts = {}

for _, server in pairs(ensure_installed_servers) do
  if should_skip(server) then
    goto continue
  end

  opts = {
    on_attach = require("core.plugin_config.lsp.handlers").on_attach,
    capabilities = require("core.plugin_config.lsp.handlers").capabilities,
  }

  if server == "lua_ls" then
    local lua_ls_opts = require "core.plugin_config.lsp.options.lua_ls"
    opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
    lspconfig.lua_ls.setup(opts)
    goto continue
  end

  if server == "gopls" then
    local gopls_opts = require "core.plugin_config.lsp.options.gopls"
    opts = vim.tbl_deep_extend("force", gopls_opts, opts)
    lspconfig.gopls.setup(opts)
    goto continue
  end

  lspconfig[server].setup(opts)
  ::continue::
end
