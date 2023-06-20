return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local setup = {
			style = "moon",
			light_style = "day",
			transparent = true,
			on_highlights = function(hl, colors)
				On_higlights(hl, colors)
			end
		}

		function On_higlights(hl, colors)
			-- change active line number color
			hl.CursorLineNr = {
				fg = colors.red1
			}

			-- change inactive line number color
			hl.LineNr = {
				fg = colors.red
			}

			if setup.transparent then
				local transparentBg = {
					bg = colors.bg_transparent
				}

				hl.GlancePreviewNormal = {
					bg = colors.bg
				}

				hl.GlancePreviewMatch = {
					bg = colors.bg_dark
				}

				hl.GlanceListNormal = {
					bg = colors.bg
				}

				hl.GlanceListMatch = {
					bg = colors.bg_dark
				}

				hl.NeoTreeNormal = transparentBg

				hl.NeoTreeNormalNC = transparentBg
			end
		end

		require('tokyonight').setup(setup)

		vim.cmd('colorscheme tokyonight')
	end
}
