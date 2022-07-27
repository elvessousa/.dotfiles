local wezterm = require("wezterm")

return {
	font = wezterm.font("Hasklug Nerd Font"),
	font_size = 15.0,
	use_fancy_tab_bar = true,
	colors = {
		background = "#080808",
		foreground = "#ffffff",
		cursor_bg = "#d7af87",
		selection_fg = "#928374",
		selection_bg = "#181818",
		ansi = {
			"#3a3b3f",
			"#fd6389",
			"#2ec27e",
			"#d7af87",
			"#87afd7",
			"#9787af",
			"#7cdce7",
			"#5f5f5f",
		},
		brights = {
			"#afafaf",
			"#fd6389",
			"#2ec27e",
			"#d7af87",
			"#87afd7",
			"#d7d7ff",
			"#7cdce7",
			"#ffffff",
		},
	},
	window_background_opacity = 0.99,
	window_padding = {
		left = 3,
		top = 0,
		bottom = 0,
		right = 0,
	},
}
