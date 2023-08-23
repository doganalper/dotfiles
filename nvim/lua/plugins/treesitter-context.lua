return {
	"nvim-treesitter/nvim-treesitter-context",
	opts = {
		enable = true,
		-- separator = '_'
		-- mode = 'topline'
	},
	event = 'VeryLazy',
	keys = function()
		vim.keymap.set("n", "gu", function()
			require("treesitter-context").go_to_context()
		end, { silent = true })
	end
}
