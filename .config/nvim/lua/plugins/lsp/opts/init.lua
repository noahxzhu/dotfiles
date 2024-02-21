local load_opts = function()
  local result = {}

  local opts_path = vim.fn.stdpath "config" .. "/lua/plugins/lsp/opts"
  local scan_result = vim.loop.fs_scandir(opts_path)

  while true do
    local name = vim.loop.fs_scandir_next(scan_result)
    if not name then
      break
    end

    if name ~= "init.lua" then
      local module_name = "plugins.lsp.opts." .. name:gsub("%.lua$", "")
      local module = require(module_name)
      result = vim.tbl_extend("force", result, module)
    end
  end

  return result
end

return load_opts()
