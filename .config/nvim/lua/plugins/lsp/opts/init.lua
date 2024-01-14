local clangd = require "plugins.lsp.opts.clangd"
local go = require "plugins.lsp.opts.go"
local java = require "plugins.lsp.opts.java"
local json = require "plugins.lsp.opts.json"
local lua = require "plugins.lsp.opts.lua"
local proto = require "plugins.lsp.opts.proto"
local python = require "plugins.lsp.opts.python"
local rust = require "plugins.lsp.opts.rust"
local typescript = require "plugins.lsp.opts.typescript"
local zig = require "plugins.lsp.opts.zig"

return vim.tbl_extend("force", clangd, go, java, json, lua, proto, python, rust, typescript, zig)
