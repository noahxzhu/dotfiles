local load_textobjects = false
return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        init = function()
          -- disable rtp plugin, as we only need its queries for mini.ai
          -- In case other textobject modules are enabled, we will load them
          -- once nvim-treesitter is loaded
          require("lazy.core.loader").disable_rtp_plugin "nvim-treesitter-textobjects"
          load_textobjects = true
        end,
      },
    },
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "c_sharp",
        "cmake",
        "cpp",
        "css",
        "csv",
        "dockerfile",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "graphql",
        "html",
        "http",
        "java",
        "javascript",
        "json",
        "kotlin",
        "lua",
        "luap",
        "make",
        "markdown",
        "markdown_inline",
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
        "toml",
        "tsx",
        "typescript",
        "vimdoc",
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

      if load_textobjects then
        -- PERF: no need to load the plugin, if we only need its queries for mini.ai
        if opts.textobjects then
          for _, mod in ipairs { "move", "select", "swap", "lsp_interop" } do
            if opts.textobjects[mod] and opts.textobjects[mod].enable then
              local Loader = require "lazy.core.loader"
              Loader.disabled_rtp_plugins["nvim-treesitter-textobjects"] = nil
              local plugin = require("lazy.core.config").plugins["nvim-treesitter-textobjects"]
              require("lazy.core.loader").source_runtime(plugin.dir, "plugin")
              break
            end
          end
        end
      end
    end,
  },
}
