local wezterm = require("wezterm")

return {
	-- enable_wayland = false,
	font = wezterm.font("FiraCode Nerd Font"),
	font_size = 11.2,
	font_rules = {
		{
			intensity = "Normal",
			italic = true,
			font = wezterm.font({
				family = "FiraCode Nerd Font",
				italic = false,
			}),
		},
		{
			intensity = "Bold",
			italic = false,
			font = wezterm.font({
				family = "FiraCode Nerd Font",
				weight = "Bold",
			}),
		},
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font({
				family = "FiraCode Nerd Font",
				weight = "Bold",
			}),
		},
	},
	default_prog = { "fish" },
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
		background = "#121212",
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
				bg_color = "#343434",
				fg_color = "#d7af87",
			},
		},
	},
	window_background_opacity = 0.995,
	window_frame = {
		active_titlebar_bg = "#343434",
		font_size = 10.0,
		font = wezterm.font({ family = "Fira Sans", weight = "Bold" }),
	  font_size = 9,
	},
	window_padding = {
		bottom = 10,
		left = 10,
		right = 10,
		top = 10,
	},
}
