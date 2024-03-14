return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = {
        "astro",
        "bash",
        "beancount",
        "c",
        "c_sharp",
        "cmake",
        "cpp",
        "css",
        "csv",
        "dockerfile",
        "gitignore",
        "glimmer",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "graphql",
        "hcl",
        "html",
        "http",
        "ini",
        "java",
        "javascript",
        "json",
        "jsonc",
        "kotlin",
        "lua",
        "luap",
        "make",
        "markdown",
        "markdown_inline",
        "php",
        "proto",
        "python",
        "query",
        "regex",
        "requirements",
        "ron",
        "rust",
        "scss",
        "sql",
        "ssh_config",
        "svelte",
        "swift",
        "terraform",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "vue",
        "xml",
        "yaml",
        "zig",
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
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
  },
}
