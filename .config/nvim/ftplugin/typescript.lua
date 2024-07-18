local wk = require "which-key"

wk.add {
  {
    mode = { "n" },
    { "<leader>C", group = "Typescript" },
    { "<leader>Cf", "<cmd>TypescriptFixAll<cr>", desc = "FixAll" },
    { "<leader>Cg", "<cmd>TypescriptGoToSourceDefinition<cr>", desc = "GoToSourceDefinition" },
    { "<leader>Ci", "<cmd>TypescriptAddMissingImports<cr>", desc = "AddMissingImports" },
    { "<leader>Co", "<cmd>TypescriptOrganizeImports<cr>", desc = "OrganizeImports" },
    { "<leader>Cr", "<cmd>TypescriptRenameFile<cr>", desc = "RenameFile" },
    { "<leader>Cu", "<cmd>TypescriptRemoveUnused<cr>", desc = "RemoveUnused" },
  },
}
