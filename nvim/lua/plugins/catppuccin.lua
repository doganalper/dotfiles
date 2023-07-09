return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require('catppuccin').setup({
			-- flavour = 'frappe',
			background = { -- :h background
				light = "latte",
				dark = "frappe",
			},
			custom_highlights = function(colors)
				return {
					CursorLineNr = { fg = colors.green },
					LineNr = { fg = colors.red },
				}
			end,
			color_overrides = {
				latte = {
					rosewater = "#c14a4a",
					flamingo = "#c14a4a",
					pink = "#945e80",
					mauve = "#945e80",
					red = "#c14a4a",
					maroon = "#c14a4a",
					peach = "#c35e0a",
					yellow = "#a96b2c",
					green = "#6c782e",
					teal = "#4c7a5d",
					sky = "#4c7a5d",
					sapphire = "#4c7a5d",
					blue = "#45707a",
					lavender = "#45707a",
					text = "#654735",
					subtext1 = "#7b5d44",
					subtext0 = "#8f6f56",
					overlay2 = "#a28368",
					overlay1 = "#b6977a",
					overlay0 = "#c9aa8c",
					surface2 = "#A79C86",
					surface1 = "#C9C19F",
					surface0 = "#DFD6B1",
					base = "#fbf1c7",
					mantle = "#F3EAC1",
					crust = "#E7DEB7",
				}
			}
		})

		vim.cmd('colorscheme catppuccin')
	end
}
