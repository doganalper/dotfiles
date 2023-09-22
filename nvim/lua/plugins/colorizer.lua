return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			"typescript",
			"javascript",
			"typescriptreact",
			"css",
			"html",
			"astro",
			"lua",
		})
	end,
}
