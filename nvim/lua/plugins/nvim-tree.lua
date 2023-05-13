return {
	"nvim-tree/nvim-tree.lua",
	tag = "nightly",
	config = function()
		require("nvim-tree").setup({
			update_cwd = true,
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
			view = {
				width = 40,
				centralize_selection = true,
				adaptive_size = true,
				number = true,
				relativenumber = true,
				side = "left",
			},
			git = {
				ignore = false,
			},
			actions = {
				open_file = {
					quit_on_open = false,
				},
			},
		})
	end,
	event = "VeryLazy", -- this is here because it would not load plugin without this if keys are
	keys = function()
		require("helpers")
		Bind("n", "<leader>1", "<cmd>NvimTreeToggle<cr>", { desc = "Map space-1 to toggle folder tree" })
	end
}
