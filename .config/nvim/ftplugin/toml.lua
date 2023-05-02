vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "Cargo.toml" },
  callback = function()
    local wk = require "which-key"

    local opts = {
      mode = "n", -- NORMAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }

    local vopts = {
      mode = "v", -- VISUAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }

    local mappings = {
      C = {
        name = "Cargo",
        A = { "<cmd>lua require'crates'.upgrade_all_crates()<cr>", "Upgrade All" },
        a = { "<cmd>lua require'crates'.update_all_crates()<cr>", "Update All" },
        C = { "<cmd>lua require'crates'.open_crates_io()<cr>", "Open Crates.io" },
        D = { "<cmd>lua require'crates'.open_documentation()<cr>", "Open Doc" },
        d = { "<cmd>lua require'crates'.show_dependencies_popup()<cr>", "Dependencies" },
        f = { "<cmd>lua require'crates'.show_features_popup()<cr>", "Features" },
        H = { "<cmd>lua require'crates'.open_homepage()<cr>", "Open Homepage" },
        R = { "<cmd>lua require'crates'.open_repository()<cr>", "Open Repo" },
        r = { "<cmd>lua require'crates'.reload()<cr>", "Reload" },
        t = { "<cmd>lua require'crates'.toggle()<cr>", "Toggle Hints" },
        U = { "<cmd>lua require'crates'.upgrade_crate()<cr>", "Upgrade" },
        u = { "<cmd>lua require'crates'.update_crate()<cr>", "Update" },
        v = { "<cmd>lua require'crates'.show_versions_popup()<cr>", "Versions" },
      },
    }

    local vmappings = {
      C = {
        name = "Cargo",
        U = { "<cmd>lua require'crates'.upgrade_crates()<cr>", "Upgrade" },
        u = { "<cmd>lua require'crates'.update_crates()<cr>", "Update" },
      },
    }

    wk.register(mappings, opts)
    wk.register(vmappings, vopts)
  end,
})
