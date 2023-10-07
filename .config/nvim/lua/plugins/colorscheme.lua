return {
  -- catppuccin
  {
    "catppuccin/nvim",
    enabled = true,
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      integrations = {
        alpha = true,
        barbar = true,
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
        mini = true,
        harpoon = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme "catppuccin"
    end,
  },

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "tokyonight-moon"
    end,
  },

  -- gruvbox-material
  {
    "sainnhe/gruvbox-material",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      -- For dark version.
      vim.opt.background = "dark"
      -- For light version.
      -- vim.opt.background = "light"

      -- Set contrast.
      -- Available values: 'hard', 'medium'(default), 'soft'
      vim.g.gruvbox_material_background = "hard"
      -- For better performance
      vim.g.gruvbox_material_better_performance = true
      vim.cmd.colorscheme "gruvbox-material"
    end,
  },
}
