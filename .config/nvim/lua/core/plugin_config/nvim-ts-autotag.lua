local ok, nvim_ts_autotag = pcall(require, "nvim-ts-autotag")
if not ok then
  return
end

nvim_ts_autotag.setup()
