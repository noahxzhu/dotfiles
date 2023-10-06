local M = {}

M.format = function()
  if require("util").has "conform.nvim" then
    require("conform").format {
      timeout_ms = 5000,
      lsp_fallback = true,
    }
  end
end

return M
