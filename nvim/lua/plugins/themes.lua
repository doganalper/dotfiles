require("catppuccin").setup({
	flavour = "macchiato",
	background = {
		light = "latte",
		dark = "macchiato",
	},
	transparent_background = false,
	custom_highlights = function(c)
		return {
			LineNr = {
				fg = c.red,
			},
		}
	end,
})

vim.cmd("colorscheme catppuccin")
