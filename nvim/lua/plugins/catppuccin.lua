return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require('catppuccin').setup({
			transparent_background = true,
			flavour = 'macchiato',
			background = { -- :h background
				light = "latte",
				dark = "macchiato",
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
				frappe = {
					rosewater = "#efc9c2",
					flamingo = "#ebb2b2",
					pink = "#f2a7de",
					mauve = "#b889f4",
					red = "#ea7183",
					maroon = "#ea838c",
					peach = "#f39967",
					yellow = "#eaca89",
					green = "#96d382",
					teal = "#78cec1",
					sky = "#91d7e3",
					sapphire = "#68bae0",
					blue = "#739df2",
					lavender = "#a0a8f6",
					text = "#b5c1f1",
					subtext1 = "#a6b0d8",
					subtext0 = "#959ec2",
					overlay2 = "#848cad",
					overlay1 = "#717997",
					overlay0 = "#63677f",
					surface2 = "#505469",
					surface1 = "#3e4255",
					surface0 = "#2c2f40",
					base = "#1a1c2a",
					mantle = "#141620",
					crust = "#0e0f16",
				}
			},
			styles = {
				comments = { "italic" }
			}
		})

		vim.cmd('colorscheme catppuccin')
	end
}
