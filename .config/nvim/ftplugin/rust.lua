local wk = require "which-key"

wk.add {
  {
    mode = { "n" },
    { "<leader>C", group = "Rust" },
    { "<leader>Cb", "<cmd>RustLsp rebuildProcMacros<cr>", desc = "Rebuild Macro" },
    { "<leader>Cc", "<cmd>RustLsp openCargo<cr>", desc = "Open Cargo" },
    { "<leader>CD", "<cmd>RustLsp renderDiagnostic<cr>", desc = "Diagnostic" },
    { "<leader>Cd", "<cmd>RustLsp debuggables<cr>", desc = "Debuggables" },
    { "<leader>Ce", "<cmd>RustLsp explainError<cr>", desc = "Explain Error" },
    { "<leader>CH", "<cmd>RustLsp hover range<cr>", desc = "Hover Range" },
    { "<leader>Ch", "<cmd>RustLsp hover actions<cr>", desc = "Hover Actions" },
    { "<leader>Cj", "<cmd>RustLsp moveItem down<cr>", desc = "Move Item Down" },
    { "<leader>Ck", "<cmd>RustLsp moveItem up<cr>", desc = "Move Item Up" },
    { "<leader>Cl", "<cmd>RustLsp joinLines<cr>", desc = "Join Lines" },
    { "<leader>Cm", "<cmd>RustLsp expandMacro<cr>", desc = "Expand Macro" },
    { "<leader>Co", "<cmd>RustLsp externalDocs<cr>", desc = "Open External Docs" },
    { "<leader>Cp", "<cmd>RustLsp parentModule<cr>", desc = "Parent Module" },
    { "<leader>CR", "<cmd>RustLsp reloadWorkspace<cr>", desc = "Reload Workspace" },
    { "<leader>Cr", "<cmd>RustLsp runnables<cr>", desc = "Runnables" },
    { "<leader>CT", "<cmd>RustLsp syntaxTree<cr>", desc = "View Syntax Tree" },
    { "<leader>Cv", "<cmd>RustLsp crateGraph [backend [output]]<cr>", desc = "View Crate Graph" },
  },
}
