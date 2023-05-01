return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("helpers")
		local gs = require("gitsigns")

		gs.setup({
			on_attach = function(bufnr)
				Bind("n", "<leader>glc", gs.preview_hunk_inline)
			end,
		})
	end,
}
