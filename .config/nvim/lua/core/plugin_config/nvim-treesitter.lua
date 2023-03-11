local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

configs.setup {
  ensure_installed = {
    "css",
    "go",
    "gomod",
    "java",
    "javascript",
    "json",
    "html",
    "lua",
    "python",
    "rust",
    "toml",
    "tsx",
    "vim",
    "yaml",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  autopairs = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
}
