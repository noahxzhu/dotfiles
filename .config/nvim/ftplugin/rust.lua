local ok, which_key = pcall(require, "which-key")
if not ok then
  return
end

local opts = {
  prefix = "<leader>",
}

local mappings = {
  C = {
    name = "Rust",
    c = { "<cmd>RustOpenCargo<Cr>", "Open Cargo" },
    D = { "<cmd>RustOpenExternalDocs<Cr>", "Open Docs" },
    d = { "<cmd>RustDebuggables<Cr>", "Debuggables" },
    m = { "<cmd>RustExpandMacro<Cr>", "Expand Macro" },
    o = { "<cmd>RustOpenExternalDocs<Cr>", "Open External Docs" },
    p = { "<cmd>RustParentModule<Cr>", "Parent Module" },
    R = {
      "<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<Cr>",
      "Reload Workspace",
    },
    r = { "<cmd>RustRunnables<Cr>", "Runnables" },
    t = { "<cmd>lua _CARGO_TEST()<cr>", "Cargo Test" },
    v = { "<cmd>RustViewCrateGraph<Cr>", "View Crate Graph" },
  },
}

which_key.register(mappings, opts)
