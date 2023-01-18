local M = {}

vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
  return
end

local luasnip_ok, luasnip = pcall(require, "luasnip")
if not luasnip_ok then
  return
end

local icons = require "core.icons"
local colors = require "core.colors"
local kind_icons = icons.kind

vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "CmpItemKindCrate", { fg = colors.red })

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
        ["<tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
        ["<s-tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
        ["<c-j>"] = function(fallback)
      if cmp.visible() then
        cmp.scroll_docs(4)
      else
        fallback()
      end
    end,
        ["<c-k>"] = function(fallback)
      if cmp.visible() then
        cmp.scroll_docs(-4)
      else
        fallback()
      end
    end,
        ["<cr>"] = function(fallback)
      if cmp.visible() then
        cmp.confirm()
      else
        fallback()
      end
    end,
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = kind_icons[vim_item.kind]

      if entry.source.name == "emoji" then
        vim_item.kind = icons.misc.Smiley
        vim_item.kind_hl_group = "CmpItemKindEmoji"
      end

      if entry.source.name == "crates" then
        vim_item.kind = icons.misc.Package
        vim_item.kind_hl_group = "CmpItemKindCrate"
      end

      -- NOTE: order matters
      vim_item.menu = ({
            nvim_lsp = "",
            nvim_lua = "",
            luasnip = "",
            buffer = "",
            path = "",
            emoji = "",
          })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" }, -- For luasnip users.
    { name = "nvim_lua" },
    { name = "buffer" },
  },
}

vim.api.nvim_create_autocmd("BufRead", {
  group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
  pattern = "Cargo.toml",
  callback = function()
    cmp.setup.buffer { sources = { { name = "crates" } } }
  end,
})

M.capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_ok then
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

local function lsp_keymaps(bufnr)
  local opts = { silent = true, buffer = bufnr }

  vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
  vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
  vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
  vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
  vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
  vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", opts)
  vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  vim.keymap.set("n", "<leader>dj", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
  vim.keymap.set("n", "<leader>dk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
  vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
end

M.on_attach = function(client, bufnr)
  local ok, navic = pcall(require, "nvim-navic")
  if ok and client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
  lsp_keymaps(bufnr)
end

return M
