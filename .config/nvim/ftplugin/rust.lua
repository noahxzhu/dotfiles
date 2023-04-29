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
    t = { "<cmd>RustTest<cr>", "Cargo Test" },
    -- v = { "<cmd>RustViewCrateGraph<cr>", "View Crate Graph" },
  },
}

wk.register(mappings, opts)
