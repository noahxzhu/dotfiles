return {
  "nvim-tree/nvim-tree.lua",
  lazy = true,
  version = "*",
  cmd = {
    "NvimTreeToggle",
  },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
  },
  init = function()
    if vim.fn.argc() == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        require "nvim-tree"
      end
    end
  end,
  opts = {
    sync_root_with_cwd = true,
    update_cwd = false,
    respect_buf_cwd = true,
    renderer = {
      group_empty = true,
      root_folder_label = ":t",
    },
    update_focused_file = {
      enable = true,
      update_root = true,
    },
    view = {
      adaptive_size = true,
      width = 40,
      side = "right",
      relativenumber = true,
      preserve_window_proportions = true,
      centralize_selection = true,
      float = {
        enable = false,
        open_win_config = {
          relative = "editor",
          border = "rounded",
          width = 40,
          height = 100000,
          row = 0,
          col = 0,
        },
      },
    },
    diagnostics = {
      enable = true,
    },
    actions = {
      open_file = {
        resize_window = true,
        quit_on_open = false,
      },
    },
    filesystem_watchers = {
      enable = true,
    },
    git = {
      ignore = false,
    },
  },
}
