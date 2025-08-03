local wezterm = require("wezterm")
local config = {}

config.font_size = 18
config.line_height = 1.2
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.font = wezterm.font("Liga SFMono Nerd Font")

return config
