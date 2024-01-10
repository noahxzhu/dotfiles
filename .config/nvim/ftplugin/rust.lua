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
    b = { "<cmd>RustLsp rebuildProcMacros<cr>", "Rebuild Macro" },
    c = { "<cmd>RustLsp openCargo<cr>", "Open Cargo" },
    D = { "<cmd>RustLsp renderDiagnostic<cr>", "Diagnostic" },
    d = { "<cmd>RustLsp debuggables<cr>", "Debuggables" },
    e = { "<cmd>RustLsp explainError<cr>", "Explain Error" },
    H = { "<cmd>RustLsp hover range<cr>", "Hover Range" },
    h = { "<cmd>RustLsp hover actions<cr>", "Hover Actions" },
    j = { "<cmd>RustLsp moveItem down<cr>", "Move Item Down" },
    k = { "<cmd>RustLsp moveItem up<cr>", "Move Item Up" },
    l = { "<cmd>RustLsp joinLines<cr>", "Join Lines" },
    m = { "<cmd>RustLsp expandMacro<cr>", "Expand Macro" },
    o = { "<cmd>RustLsp externalDocs<cr>", "Open External Docs" },
    p = { "<cmd>RustLsp parentModule<cr>", "Parent Module" },
    R = { "<cmd>RustLsp reloadWorkspace<cr>", "Reload Workspace" },
    r = { "<cmd>RustLsp runnables<cr>", "Runnables" },
    T = { "<cmd>RustLsp syntaxTree<cr>", "View Syntax Tree" },
    v = { "<cmd>RustLsp crateGraph [backend [output]]<cr>", "View Crate Graph" },
  },
}

wk.register(mappings, opts)
