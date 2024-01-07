return {
  "voldikss/vim-floaterm",
  keys = {
    {
      "<leader>fy",
      mode = "n",
      "<cmd>FloatermNew --height=2.0 --width=2.0 --wintype=float --opener=edit --title=Yazi yazi<cr>",
      desc = "Yazi",
    },
    {
      "<leader>gg",
      mode = "n",
      "<cmd>FloatermNew --height=2.0 --width=2.0 --wintype=float --title=Lazygit lazygit<cr>",
      desc = "Lazygit",
    },
  },
}
