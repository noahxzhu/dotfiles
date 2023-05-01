return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "css",
      "go",
      "gomod",
      "java",
      "javascript",
      "json",
      "html",
      "lua",
      "luap",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "rust",
      "typescript",
      "toml",
      "tsx",
      "vimdoc",
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
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
