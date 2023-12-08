return {
  "utilyre/barbecue.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "SmiteshP/nvim-navic",
  },
  config = function()
    -- triggers CursorHold event faster
    vim.opt.updatetime = 200

    require("barbecue").setup {
      create_autocmd = false, -- prevent barbecue from updating itself automatically
      attach_navic = false,
      show_modified = true,
    }

    vim.api.nvim_create_autocmd({
      "WinResized",
      "BufWinEnter",
      "CursorHold",
      "InsertLeave",
      "BufModifiedSet",
    }, {
      group = vim.api.nvim_create_augroup("barbecue.updater", {}),
      callback = function()
        require("barbecue.ui").update()
      end,
    })
  end,
}
