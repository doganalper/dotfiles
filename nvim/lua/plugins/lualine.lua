require("lualine").setup({
	options = {
		theme = "tokyonight",
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
