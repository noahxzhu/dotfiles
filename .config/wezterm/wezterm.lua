local wezterm = require("wezterm")
local config = {}

-- config.font = wezterm.font({
-- 	family = "Comic Code Ligatures",
-- })
config.font = wezterm.font_with_fallback({
	"Comic Code",
	{ family = "Symbols Nerd Font", scale = 0.75 },
})
config.font_size = 14
config.color_scheme = "Batman"
config.line_height = 1.4

return config
