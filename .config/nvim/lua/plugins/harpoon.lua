return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufReadPre", "BufNewFile" },
  -- stylua: ignore
  keys = {
    { "<leader>ha", mode = { "n" }, function() require("harpoon"):list():append() end, desc = "Add File" },
    { "<leader>hn", mode = { "n" }, function() require("harpoon"):list():next() end, desc = "Nav Next" },
    { "<leader>hp", mode = { "n" }, function() require("harpoon"):list():prev() end, desc = "Nav Prev" },
    { "<leader>ht", mode = { "n" }, function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Toggle Quick Menu" },
  },
  config = function()
    require("harpoon"):setup {
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    }
  end,
}
