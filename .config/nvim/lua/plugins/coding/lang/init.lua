local Util = require "util"

local go = require "plugins.coding.lang.go"
local java = require "plugins.coding.lang.java"
local python = require "plugins.coding.lang.python"
local rust = require "plugins.coding.lang.rust"
local typescript = require "plugins.coding.lang.typescript"

return Util.merge(go, java, python, rust, typescript)
