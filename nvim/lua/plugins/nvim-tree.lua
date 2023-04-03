require("nvim-tree").setup({
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	view = {
		width = 40,
		centralize_selection = true,
		adaptive_size = true,
		number = true,
		relativenumber = true,
		side = "right",
		float = {
			enable = true,
		},
	},
	git = {
		ignore = false,
	},
})
