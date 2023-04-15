local Util = require "lazy.core.util"

local go = require "plugins.lsp.opts.go"
local json = require "plugins.lsp.opts.json"
local lua = require "plugins.lsp.opts.lua"
local rust = require "plugins.lsp.opts.rust"
local typescript = require "plugins.lsp.opts.typescript"

return Util.merge(go, json, lua, rust, typescript)
