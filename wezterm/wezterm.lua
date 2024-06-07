-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "Batman"
config.adjust_window_size_when_changing_font_size = false
config.colors = {
	foreground = "silver",
	background = "black",
	cursor_bg = "#52ad70",
	cursor_fg = "black",
	cursor_border = "#52ad70",
	selection_fg = "black",
	selection_bg = "#fffacd",
	scrollbar_thumb = "#222222",
	split = "#444444",
}

config.window_background_opacity = 0.97
config.colors.background = "#111111"
config.font_size = 12
config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
})

config.color_scheme = "Gruvbox"
config.use_fancy_tab_bar = false

config.enable_scroll_bar = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.tab_bar_at_bottom = true
config.freetype_load_target = "HorizontalLcd"

return config
