local wk = require "which-key"

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
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
