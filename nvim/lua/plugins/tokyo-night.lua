return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require('tokyonight').setup({
			style = "moon",
			light_style = "day",
			transparent = false,
			on_highlights = function(hl, colors)
				-- change active line number color
				hl.CursorLineNr = {
					fg = colors.red1
				}

				-- change inactive line number color
				hl.LineNr = {
					fg = colors.red
				}

				-- NOTE: Uncomment these if transparent is back on the table

				-- hl.GlancePreviewNormal = {
				-- 	bg = colors.bg
				-- }

				-- hl.GlancePreviewMatch = {
				-- 	bg = colors.bg_dark
				-- }

				-- hl.GlanceListNormal = {
				-- 	bg = colors.bg
				-- }

				-- hl.GlanceListMatch = {
				-- 	bg = colors.bg_dark
				-- }

			end
		})

		vim.cmd('colorscheme tokyonight')
	end
}
