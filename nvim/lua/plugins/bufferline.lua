return {
	'akinsho/bufferline.nvim',
	version = "*",
	config = function()
		require("bufferline").setup {
			options = {
				diagnostics = 'nvim_lsp',
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
				offsets = {
					{
						filetype = 'neo-tree',
						text = "Files",
						text_align = "center",
					}
				},
				-- separator_style = "slant",
			}
		}
	end,
}
