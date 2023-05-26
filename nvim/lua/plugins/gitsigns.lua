return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gs = require("gitsigns")

		gs.setup({
			on_attach = function(bufnr)
				vim.keymap.set("n", "<leader>glc", gs.preview_hunk_inline)
			end,
		})
	end,
}
