local wezterm = require("wezterm")

return {
	font = wezterm.font("VictorMono Nerd Font", { weight = "Medium" }),
	font_size = 15.0,
	use_fancy_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	tab_bar_at_bottom = true,
	hyperlink_rules = {
		-- Localhost links
		{
			regex = "\\b\\w+://[\\w.-]+\\S*\\b",
			format = "$0",
		},
		-- Numeric links
		{
			regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
			format = "$0",
		},
	},
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
		tab_bar = {
			active_tab = {
				bg_color = "#343434",
				fg_color = "#ffffff",
			},
			inactive_tab = {
				bg_color = "#343434",
				fg_color = "#555",
			},
			inactive_tab_hover = {
				bg_color = "#343434",
				fg_color = "#777",
			},
			inactive_tab_edge = "#343434",
			new_tab = {
				bg_color = "#343434",
				fg_color = "#ffffff",
			},
			new_tab_hover = {
				bg_color = "#080808",
				fg_color = "#d7af87",
			},
		},
	},
	window_background_opacity = 0.99,
	window_frame = {
		active_titlebar_bg = "#343434",
		font_size = 12.0,
	},
	window_padding = {
		bottom = 0,
		left = 3,
		right = 0,
		top = 3,
	},
}
