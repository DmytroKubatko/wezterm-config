local wezterm = require("wezterm")
local config = {}

config.initial_cols = 160
config.initial_rows = 70

config.window_padding = {
	left = 0,
	right = 0,
	top = 10,
	bottom = 10,
}

-- get gefault One Dark theme colors
local my_one_dark = wezterm.color.get_builtin_schemes()["One Dark (Gogh)"]

-- both colors changes made to mimic this nvim colorscheme https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/palette.lua {warmer}
-- set text color to yellow
my_one_dark.foreground = "#dbb671"
-- set background to warm gray
my_one_dark.background = "#232326"

-- replace default colorscheme with updated variant
config.color_schemes = {
	["One Dark (Gogh)"] = my_one_dark,
}

config.color_scheme = "One Dark (Gogh)"

-- control inactive pane dimming
config.inactive_pane_hsb = {
	hue = 1.0,
	saturation = 1.0,
	brightness = 0.5,
}

return config
