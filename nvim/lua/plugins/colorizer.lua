return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			"typescript",
			"javascript",
			"css",
			"html",
			"astro"
		})
	end
}
