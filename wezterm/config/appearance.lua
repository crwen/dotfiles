local wezterm = require("wezterm")

-- Color scheme:
-- config.color_scheme = "AdventureTime"
-- config.color_scheme = "Tokyo Night Moon"
-- config.color_scheme = "Tokyo Night Storm"
-- config.color_scheme = "Tokyo Night Storm (Gogh)"
-- config.color_scheme = "One Dark (Gogh)"
--
--
-- Font
-- config.font = wezterm.font({
-- 	-- family = "JetBrainsMono Nerd Font",
-- 	-- family = "JetBrainsMono Nerd Font",
-- 	family = "JetBrains Mono NL",
-- 	-- harfbuzz_features = { "zero" },
-- })
-- config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold", italic = true })
-- config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" })

return {
	term = "xterm-256color",
	animation_fps = 60,
	max_fps = 60,

	color_scheme = "Tokyo Night Moon",

	font = wezterm.font_with_fallback({
		"Consolas",
		"Consolas NF",
		{
			family = "JetBrains Mono",
			-- harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
		},
		"JetBrains Mono NL",
		"JetBrainsMono Nerd Font",
		-- "FiraCode Nerd Font",
		-- "DengXian",
		"Noto Color Emoji",
	}),
	font_size = 12,

	colors = {
		tab_bar = {
			background = "#343654",
			active_tab = {
				bg_color = "#343654",
				fg_color = "#c0c0c0",
				-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
				-- label shown for this tab.
				-- The default is "Normal"
				intensity = "Half",

				-- Specify whether you want "None", "Single" or "Double" underline for
				-- label shown for this tab.
				-- The default is "None"
				-- underline = "None",
				underline = "Double",

				-- Specify whether you want the text to be italic (true) or not (false)
				-- for this tab.  The default is false.
				italic = false,
				-- italic = true,

				-- Specify whether you want the text to be rendered with strikethrough (true)
				-- or not for this tab.  The default is false.
				strikethrough = true,
			},
			-- The color of the inactive tab bar edge/divider
			inactive_tab_edge = "#575757",
			-- inactive_tab_edge = "#343654",
			-- inactive_tab = {
			-- bg_color = "#343654",
			-- fg_color = "#808080",
			-- italic = true,
			-- },
			-- The new tab button that let you create new tabs
			new_tab = {
				bg_color = "#343654",
				fg_color = "#808080",
			},
		},
	},

	-- show_tabs_in_tab_bar
	-- tab bar
	enable_tab_bar = false,
	hide_tab_bar_if_only_one_tab = false,
	use_fancy_tab_bar = true,
	tab_max_width = 25,
	show_tab_index_in_tab_bar = true,
	switch_to_last_active_tab_when_closing_tab = true,

	-- window
	-- window_decorations = "INTEGRATED_BUTTONS|RESIZE",
	-- window_decorations = "INTEGRATED_BUTTONS|RESIZE",
	-- window_decorations = "None",
	window_decorations = "RESIZE",
	-- integrated_title_button_style = "Windows",
	integrated_title_button_color = "auto",
	integrated_title_button_alignment = "Right",
	initial_cols = 120,
	initial_rows = 24,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	window_close_confirmation = "AlwaysPrompt",
	window_frame = {
		-- The font used in the tab bar.
		-- Roboto Bold is the default; this font is bundled
		-- with wezterm.
		-- Whatever font is selected here, it will have the
		-- main font setting appended to it to pick up any
		-- fallback fonts you may have used there.
		font = wezterm.font({ family = "Consolas", weight = "Bold" }),

		-- The size of the font in the tab bar.
		-- Default to 10.0 on Windows but 12.0 on other systems
		font_size = 12.0,

		-- The overall background color of the tab bar when
		-- the window is focused
		-- active_titlebar_bg = "#343654",

		-- The overall background color of the tab bar when
		-- the window is not focused
		-- inactive_titlebar_bg = "#333333",

		active_titlebar_bg = "#090909",
		inactive_titlebar_bg = "#343654",
		-- font = fonts.font,
		-- font_size = fonts.font_size,
	},
	inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
}
