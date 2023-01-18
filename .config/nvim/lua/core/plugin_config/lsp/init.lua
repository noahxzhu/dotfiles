local ok = pcall(require, "lspconfig")
if not ok then
  return
end

require "core.plugin_config.lsp.mason"
require "core.plugin_config.lsp.null-ls"

require "core.plugin_config.lsp.languages.go"
require "core.plugin_config.lsp.languages.rust"
require "core.plugin_config.lsp.languages.js-ts"
