local Util = require "util"

local go = require "plugins.dap.lang.go"
local python = require "plugins.dap.lang.python"
local rust = require "plugins.dap.lang.rust"
local typescript = require "plugins.dap.lang.typescript"

return Util.merge(go, python, rust, typescript)
