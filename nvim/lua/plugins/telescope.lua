local commonDropdown = {
	previewer = false,
	theme = "dropdown",
}

require("telescope").setup({
	defaults = {
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
			},
			center = {
				prompt_position = "top",
			},
		},
		prompt_prefix = "🔍 ",
	},
	pickers = {
		colorscheme = commonDropdown,
		-- live_grep = commonDropdown,
		-- live_grep = {
		-- 	theme = "ivy",
		-- },
		find_files = commonDropdown,
		oldfiles = commonDropdown,
		git_bcommits = {
			layout_config = {
				preview_width = 100,
			},
		},
		buffers = commonDropdown,
	},
})
