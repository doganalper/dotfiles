local commonDropdown = {
	previewer = false,
	theme = "dropdown",
}

local telescope = require("telescope")

telescope.setup({
	defaults = {
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.6,
			},
			center = {
				prompt_position = "top",
			},
		},
		prompt_prefix = "🔍 ",
	},
	pickers = {
		colorscheme = commonDropdown,
		oldfiles = commonDropdown,
	},
	extensions = {
		advanced_git_search = {
			diff_plugin = "fugitive",
			git_flags = {},
			git_diff_flags = {},
		},
	},
})

telescope.load_extension("advanced_git_search")
