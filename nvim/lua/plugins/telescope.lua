local commonDropdown = {
	previewer = false,
	theme = "dropdown",
}

require("telescope").setup({
	defaults = {
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "bottom",
				preview_width = 80,
			},
			center = {
				prompt_position = "top",
			},
		},
		prompt_prefix = "🔍 ",
	},
	pickers = {
		colorscheme = commonDropdown,
		find_files = commonDropdown,
		oldfiles = commonDropdown,
		buffers = commonDropdown,
	},
})
