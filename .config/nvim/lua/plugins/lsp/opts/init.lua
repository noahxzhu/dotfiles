local Util = require "lazy.core.util"

local go = require "plugins.lsp.opts.go"
local json = require "plugins.lsp.opts.json"
local lua = require "plugins.lsp.opts.lua"

return Util.merge(go, json, lua)
