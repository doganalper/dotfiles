return {
	"folke/tokyonight.nvim",
	config = function()
		require("tokyonight").setup({
			on_highlights = function(hl) end,
		})
	end,
}
