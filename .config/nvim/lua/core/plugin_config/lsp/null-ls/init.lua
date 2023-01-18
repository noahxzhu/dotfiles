local ok, null_ls = pcall(require, "null-ls")
if not ok then
  return
end

local b = null_ls.builtins

local sources = {
  -- code actions
  b.code_actions.gitsigns,

  -- completion
  b.completion.luasnip,
  b.completion.spell,

  -- diagnostics
  b.diagnostics.checkmake,
  b.diagnostics.codespell.with {
    extra_args = { "--config", vim.fn.stdpath "config" .. "/.codespellrc" },
  },
  b.diagnostics.flake8,
  b.diagnostics.markdownlint,
  b.diagnostics.shellcheck,
  b.diagnostics.staticcheck,
  b.diagnostics.tsc,
  b.diagnostics.zsh,

  -- formatting
  b.formatting.black,
  b.formatting.goimports,
  b.formatting.google_java_format,
  b.formatting.isort,
  b.formatting.jq,
  b.formatting.prettier,
  b.formatting.stylua,

  -- hover
  b.hover.dictionary,
}

local typescript_code_actions_ok, typescript_code_actions = pcall(require, "typescript.extensions.null-ls.code-actions")
if typescript_code_actions_ok then
  table.insert(sources, typescript_code_actions)
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  debug = false,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
