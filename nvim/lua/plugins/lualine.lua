return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = false,
				global_status = true,
				theme = "catppuccin",
				-- component_separators = "",
				-- section_separators = "",
				disabled_filetypes = { "NvimTree", "fugitiveblame", "neo-tree" },
			},
			sections = {
				lualine_b = {
					{
						"filename",
						path = 1,
					},
				},
				lualine_c = {},
				lualine_x = {
					{ "filetype", separator = "", padding = { right = 1 } },
				},
				lualine_y = { "branch", "diff", "diagnostics" },
			},
			inactive_sections = {
				lualine_c = {
					{
						"filename",
						path = 1,
					},
				},
				lualine_y = {
					{ "filetype", separator = "", padding = { right = 0 } },
				},
			},
		})
	end,
}
