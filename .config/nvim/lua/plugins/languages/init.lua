local Util = require "util"

local go = require "plugins.languages.go"
local java = require "plugins.languages.java"
local python = require "plugins.languages.python"
local rust = require "plugins.languages.rust"
local typescript = require "plugins.languages.typescript"

return Util.merge(go, java, python, rust, typescript)
