return {
  "czheo/mojo.vim",
  ft = { "mojo" },
  init = function()
    vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
      pattern = { "*.🔥" },
      callback = function()
        if vim.bo.filetype ~= "mojo" then
          vim.bo.filetype = "mojo"
        end
      end,
    })
  end,
}
