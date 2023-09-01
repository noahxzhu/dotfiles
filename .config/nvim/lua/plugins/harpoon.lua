M = {
  "ThePrimeagen/harpoon",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<leader>ha",
      mode = { "n" },
      function()
        require("harpoon.mark").add_file()
      end,
      desc = "Add File",
    },
    {
      "<leader>hn",
      mode = { "n" },
      function()
        require("harpoon.ui").nav_next()
      end,
      desc = "Nav Next",
    },
    {
      "<leader>hp",
      mode = { "n" },
      function()
        require("harpoon.ui").nav_prev()
      end,
      desc = "Nav Prev",
    },
    {
      "<leader>ht",
      mode = { "n" },
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      desc = "Toggle Quick Menu",
    },
  },
}

return M
