M = {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require "conform"

    -- customize the formatters
    local util = require "conform.util"

    -- rustfmt
    local rustfmt = require "conform.formatters.rustfmt"
    conform.formatters.rustfmt = vim.tbl_deep_extend("force", rustfmt, {
      args = util.extend_args(rustfmt.args, function(ctx)
        local Path = require "plenary.path"
        local found = vim.fs.find("Cargo.toml", { upward = true, path = ctx.dirname })[1]
        if found then
          local cargo_toml = Path:new(found)
          if cargo_toml:exists() and cargo_toml:is_file() then
            for _, line in ipairs(cargo_toml:readlines()) do
              local edition = line:match [[^edition%s*=%s*%"(%d+)%"]]
              if edition then
                return { "--edition=" .. edition }
              end
            end
          end
        end

        -- default edition when we don't find `Cargo.toml` or the `edition` in it.
        return { "--edition=2021" }
      end),
    })

    conform.setup {
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    }

    conform.formatters_by_ft.javascript = { "prettierd" }
    conform.formatters_by_ft.javascriptreact = { "prettierd" }
    conform.formatters_by_ft.typescript = { "prettierd" }
    conform.formatters_by_ft.typescriptreact = { "prettierd" }
    conform.formatters_by_ft.html = { "prettierd" }
    conform.formatters_by_ft.css = { "prettierd" }
    conform.formatters_by_ft.json = { "prettierd" }
    conform.formatters_by_ft.yaml = { "prettierd" }
    conform.formatters_by_ft.markdown = { "prettierd" }
    conform.formatters_by_ft.graphql = { "prettierd" }
    conform.formatters_by_ft.lua = { "stylua" }
    conform.formatters_by_ft.python = { "isort", "black" }
    conform.formatters_by_ft.rust = { "rustfmt" }
    conform.formatters_by_ft.java = { "google-java-format" }
  end,
}

return M
