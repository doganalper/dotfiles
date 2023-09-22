return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettier.with({
					-- prefer_local = "node_modules/.bin",
					extra_filetypes = { "astro" },
				}),
			},
		})
	end,
}
