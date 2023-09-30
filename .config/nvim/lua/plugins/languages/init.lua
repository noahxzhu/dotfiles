local go = require "plugins.languages.go"
local java = require "plugins.languages.java"
local python = require "plugins.languages.python"
local rust = require "plugins.languages.rust"
local typescript = require "plugins.languages.typescript"

return { unpack(go), unpack(java), unpack(python), unpack(rust), unpack(typescript) }
