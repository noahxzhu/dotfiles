local wk = require "which-key"

local opts = {
  prefix = "<leader>",
}

local mappings = {
  C = {
    name = "Typescript React",
    f = { "<cmd>TypescriptFixAll<cr>", "FixAll" },
    g = { "<cmd>TypescriptGoToSourceDefinition<cr>", "GoToSourceDefinition" },
    i = { "<cmd>TypescriptAddMissingImports<cr>", "AddMissingImports" },
    o = { "<cmd>TypescriptOrganizeImports<cr>", "OrganizeImports" },
    r = { "<cmd>TypescriptRenameFile<cr>", "RenameFile" },
    u = { "<cmd>TypescriptRemoveUnused<cr>", "RemoveUnused" },
  },
}

wk.register(mappings, opts)
