local M = {}

M.pyright = {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
        autoImportCompletions = true,
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      },
    },
  },
}

return M
