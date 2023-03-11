local ok, which_key = pcall(require, "which-key")
if not ok then
  return
end

local opts = {
  prefix = "<leader>",
}

local mappings = {
  C = {
    name = "Javascript React",
    f = { "<cmd>TypescriptFixAll<Cr>", "FixAll" },
    g = { "<cmd>TypescriptGoToSourceDefinition<Cr>", "GoToSourceDefinition" },
    i = { "<cmd>TypescriptAddMissingImports<Cr>", "AddMissingImports" },
    o = { "<cmd>TypescriptOrganizeImports<cr>", "OrganizeImports" },
    r = { "<cmd>TypescriptRenameFile<Cr>", "RenameFile" },
    u = { "<cmd>TypescriptRemoveUnused<Cr>", "RemoveUnused" },
  },
}

which_key.register(mappings, opts)
