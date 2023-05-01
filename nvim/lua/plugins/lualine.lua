return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin",
				component_separators = "",
				section_separators = "",
				disabled_filetypes = { "NvimTree", "fugitiveblame" },
			},
			sections = {
				lualine_c = { "%=", {
					"filename",
					path = 1,
				} },
			},
		})
	end,
}
