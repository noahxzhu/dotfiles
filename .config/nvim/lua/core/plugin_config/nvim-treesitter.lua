local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

configs.setup {
  ensure_installed = {
    "go",
    "gomod",
    "java",
    "javascript",
    "lua",
    "python",
    "rust",
    "toml",
    "vim",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  autopairs = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
}
