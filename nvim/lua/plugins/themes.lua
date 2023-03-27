require("rose-pine").setup({
	dark_variant = "moon",
})

require("tokyonight").setup({
	style = "night",
	light_style = "day",
	on_highlights = function(hl, c)
		hl.CursorLineNr = {
			fg = c.red,
		}
		hl.LineNr = {
			fg = c.red,
			bold = true,
		}
	end,
})

require("palenightfall").setup()

require("sweetie").setup()

require("catppuccin").setup({
	flavour = "frappe",
	background = {
		light = "latte",
		dark = "macchiato",
	},
	custom_highlights = function(c)
		return {
			LineNr = {
				fg = c.red,
			},
		}
	end,
})

vim.cmd("colorscheme catppuccin")
