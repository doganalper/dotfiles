return {
	"nvim-tree/nvim-tree.lua",
	tag = "nightly",
	config = function()
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
				float = {
					enable = true,
					quit_on_focus_loss = true,
				},
			},
			git = {
				ignore = false,
			},
		})
	end,
}
