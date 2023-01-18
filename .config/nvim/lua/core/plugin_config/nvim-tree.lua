local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
  return
end

nvim_tree.setup {
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  view = {
    adaptive_size = false,
    width = 40,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
}
