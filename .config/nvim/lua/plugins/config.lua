local load = function(name)
  local Util = require "lazy.core.util"
  local mod = "config." .. name
  Util.try(function()
    require(mod)
  end, {
    msg = "Failed loading " .. mod,
    on_error = function(msg)
      local info = require("lazy.core.cache").find(mod)
      if info == nil or (type(info) == "table" and #info == 0) then
        return
      end
      Util.error(msg)
    end,
  })
end

-- load options here, before lazy init while sourcing plugin modules
-- this is needed to make sure options will be correctly applied
-- after installing missing plugins
load "options"

-- autocmds and keymaps can wait to load
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    load "autocmds"
    load "keymaps"
  end,
})

return {}
