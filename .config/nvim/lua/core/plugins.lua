local ensure_packer = function()
  local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim"

  use "ahmedkhalf/project.nvim"

  -- Color Schemes
  use "EdenEast/nightfox.nvim"
  use { "catppuccin/nvim", as = "catppuccin" }
  use "rebelot/kanagawa.nvim"
  use "shaunsingh/nord.nvim"

  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  use "windwp/nvim-autopairs"
  use "norcalli/nvim-colorizer.lua"
  use "numToStr/Comment.nvim"
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  }

  use { "akinsho/toggleterm.nvim", tag = "*" }

  use {
    "goolord/alpha-nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
  }

  use {
    "nvim-tree/nvim-tree.lua",
    requires = "nvim-tree/nvim-web-devicons",
  }

  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  }

  use { "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" }

  use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = { { "nvim-lua/plenary.nvim" } },
  }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use "nvim-telescope/telescope-media-files.nvim"

  use "folke/which-key.nvim"

  use "neovim/nvim-lspconfig" -- Configurations for Nvim LSP
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use "j-hui/fidget.nvim"
  use "lvimuser/lsp-inlayhints.nvim"
  use "SmiteshP/nvim-navic"
  use "lewis6991/gitsigns.nvim"
  use "lukas-reineke/indent-blankline.nvim"

  use { "phaazon/hop.nvim", branch = "v2" }

  -- Auto Completion
  use "hrsh7th/nvim-cmp" -- Autocompletion plugin
  use "hrsh7th/cmp-nvim-lsp" -- LSP source for nvim-cmp
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lua"

  use { "folke/noice.nvim", requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } }

  -- Rust
  use "simrat39/rust-tools.nvim"
  use {
    "saecki/crates.nvim",
    tag = "v0.3.0",
    requires = { "nvim-lua/plenary.nvim" },
  }

  -- Go
  use "olexsmir/gopher.nvim"

  -- Java
  use "mfussenegger/nvim-jdtls"

  -- Python
  use "mfussenegger/nvim-dap-python"

  -- Typescript, Javascript, Node.js
  use "mxsdev/nvim-dap-vscode-js"
  use "jose-elias-alvarez/typescript.nvim"

  -- Debug
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    packer.sync()
  end
end)
