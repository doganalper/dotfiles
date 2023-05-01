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
				lualine_c = {
					"%=",
					{ "filetype", icon_only = true, separator = "", padding = { right = 0, left = 1 } },
					{
						"filename",
						path = 1,
					},
				},
				lualine_b = {},
				lualine_x = {},
				lualine_y = { "branch", "diff", "diagnostics" },
			},
			inactive_sections = {
				lualine_c = {
					"%=",
					{ "filetype", icon_only = true, separator = "", padding = { right = 0, left = 1 } },
					{
						"filename",
						path = 1,
					},
				},
			},
		})
	end,
}
