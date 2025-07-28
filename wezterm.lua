local wezterm = require("wezterm")
local lib = require("lib")
local windowConfig = require("window")
local fontConfig = require("font")
local keysConfig = require("keys")

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

tabline.setup({
	options = {
		icons_enabled = true,
		theme = "tokyonight_night",
		tabs_enabled = true,
		theme_overrides = {},
		section_separators = "",
		component_separators = "",
		tab_separators = {
			left = wezterm.nerdfonts.ple_right_half_circle_thick,
			right = wezterm.nerdfonts.ple_left_half_circle_thick,
		},
	},
	sections = {
		tabline_a = "",
		tabline_b = "",
		tabline_c = "",
		tab_active = {
			{ "cwd", padding = 0, max_length = 32 },
			{ "zoomed", padding = 0 },
		},
		tab_inactive = {
			{ "cwd", padding = 1, max_length = 32 },
			{ "zoomed", padding = 0 },
		},
		tabline_x = { "ram", "cpu" },
		tabline_y = "",
		tabline_z = "",
	},
	extensions = {},
})

-- this move allow us to override some tabline defaults, set via apply_to_config
local initConfig = {}
tabline.apply_to_config(initConfig)

local config = lib.mergeTables(initConfig, windowConfig, fontConfig, keysConfig)

wezterm.on("gui-startup", function(cmd)
	-- Get the list of screens
	local screen = wezterm.gui.screens().active

	-- Get the dimensions of the active screen
	local screen_width = screen.width
	local screen_height = screen.height

	local window_width = 180

	-- Create a new window with the specified position and size
	local tab, pane, window = wezterm.mux.spawn_window({
		position = {
			x = screen_width / 2 + window_width,
			y = screen_height / 2,
		},
		width = window_width,
		height = 90,
	})
end)

return config
