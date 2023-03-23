local wk = require "which-key"

local opts = {
  prefix = "<leader>",
}

local mappings = {
  C = {
    name = "Rust",
    c = { "<cmd>RustOpenCargo<cr>", "Open Cargo" },
    D = { "<cmd>RustOpenExternalDocs<cr>", "Open Docs" },
    d = { "<cmd>RustDebuggables<cr>", "Debuggables" },
    m = { "<cmd>RustExpandMacro<cr>", "Expand Macro" },
    o = { "<cmd>RustOpenExternalDocs<cr>", "Open External Docs" },
    p = { "<cmd>RustParentModule<cr>", "Parent Module" },
    R = {
      "<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<cr>",
      "Reload Workspace",
    },
    r = { "<cmd>RustRunnables<cr>", "Runnables" },
    t = { "<cmd>lua _CARGO_TEST()<cr>", "Cargo Test" },
    v = { "<cmd>RustViewCrateGraph<cr>", "View Crate Graph" },
  },
}

wk.register(mappings, opts)
