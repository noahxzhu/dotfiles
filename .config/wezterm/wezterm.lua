local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font({
	family = "Comic Code Ligatures",
})
config.font_size = 14
config.color_scheme = "Batman"
config.line_height = 1.4

return config
