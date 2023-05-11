return {
	"folke/todo-comments.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("todo-comments").setup({})
	end,
	keys = {
		{
			"<leader>td",
			"<cmd>TodoTelescope theme=ivy initial_mode=insert previewer=false layout_config={bottom_pane={height=12}}<cr>",
			{ desc = "[T]o[D]o" },
		},
	},
}
