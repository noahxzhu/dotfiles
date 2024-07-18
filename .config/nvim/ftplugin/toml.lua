vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "Cargo.toml" },
  callback = function()
    local wk = require "which-key"

    wk.add {
      {
        mode = { "n" },
        { "<leader>C", group = "Cargo" },
        { "<leader>CA", "<cmd>lua require'crates'.upgrade_all_crates()<cr>", desc = "Upgrade All" },
        { "<leader>Ca", "<cmd>lua require'crates'.update_all_crates()<cr>", desc = "Update All" },
        { "<leader>CC", "<cmd>lua require'crates'.open_crates_io()<cr>", desc = "Open Crates.io" },
        { "<leader>CD", "<cmd>lua require'crates'.open_documentation()<cr>", desc = "Open Doc" },
        { "<leader>Cd", "<cmd>lua require'crates'.show_dependencies_popup()<cr>", desc = "Dependencies" },
        { "<leader>Cf", "<cmd>lua require'crates'.show_features_popup()<cr>", desc = "Features" },
        { "<leader>CH", "<cmd>lua require'crates'.open_homepage()<cr>", desc = "Open Homepage" },
        { "<leader>CR", "<cmd>lua require'crates'.open_repository()<cr>", desc = "Open Repo" },
        { "<leader>Cr", "<cmd>lua require'crates'.reload()<cr>", desc = "Reload" },
        { "<leader>Ct", "<cmd>lua require'crates'.toggle()<cr>", desc = "Toggle Hints" },
        { "<leader>CU", "<cmd>lua require'crates'.upgrade_crate()<cr>", desc = "Upgrade" },
        { "<leader>Cu", "<cmd>lua require'crates'.update_crate()<cr>", desc = "Update" },
        { "<leader>Cv", "<cmd>lua require'crates'.show_versions_popup()<cr>", desc = "Versions" },
      },
    }

    wk.add {
      {
        mode = { "v" },
        { "<leader>C", group = "Cargo" },
        { "<leader>CU", "<cmd>lua require'crates'.upgrade_crates()<cr>", desc = "Upgrade" },
        { "<leader>Cu", "<cmd>lua require'crates'.update_crates()<cr>", desc = "Update" },
      },
    }
  end,
})
