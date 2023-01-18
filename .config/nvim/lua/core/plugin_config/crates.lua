local ok, crates = pcall(require, "crates")
if not ok then
  return
end

ok = pcall(require, "null-ls")
if not ok then
  return
end

crates.setup {
  null_ls = {
    enabled = true,
    name = "crates.nvim",
  },
}
