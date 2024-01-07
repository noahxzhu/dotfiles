return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require "lint"
    lint.linters_by_ft = {
      go = { "golangcilint" },
      kotlin = { "ktlint" },
      markdown = { "markdownlint" },
      python = { "flake8" },
    }

    local ktlint = require("lint").linters.ktlint
    ktlint.args = { "--reporter=json", "--stdin" }

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("lazy_lint", { clear = true }),
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
