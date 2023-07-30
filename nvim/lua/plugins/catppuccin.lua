return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require('catppuccin').setup({
			-- transparent_background = true,
			flavour = 'mocha',
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			custom_highlights = function(colors)
				return {
					CursorLineNr = { fg = colors.green },
					LineNr = { fg = colors.red },
					NormalFloat = { bg = colors.base },
					NeoTreeGitAdded = { fg = colors.text },
					NeoTreeGitModified = { fg = colors.text },
					NeoTreeGitUntracked = { fg = colors.text },
					NeoTreeGitTracked = { fg = colors.text },
				}
			end,
			color_overrides = {
				mocha = {
					rosewater = "#EA6962",
					flamingo = "#EA6962",
					pink = "#D3869B",
					mauve = "#D3869B",
					red = "#EA6962",
					maroon = "#EA6962",
					peach = "#BD6F3E",
					yellow = "#D8A657",
					green = "#A9B665",
					teal = "#89B482",
					sky = "#89B482",
					sapphire = "#89B482",
					blue = "#7DAEA3",
					lavender = "#7DAEA3",
					text = "#D4BE98",
					subtext1 = "#BDAE8B",
					subtext0 = "#A69372",
					overlay2 = "#8C7A58",
					overlay1 = "#735F3F",
					overlay0 = "#958272",
					surface2 = "#4B4F51",
					surface1 = "#2A2D2E",
					surface0 = "#232728",
					base = "#1D2021",
					mantle = "#191C1D",
					crust = "#151819",
				},
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
			},
			styles = {
				comments = { "italic" }
			}
		})

		vim.cmd('colorscheme catppuccin')
	end
}
