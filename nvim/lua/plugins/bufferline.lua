require("bufferline").setup({
	highlights = require("catppuccin.groups.integrations.bufferline").get(),
	options = {
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = true,
			},
			{
				filetype = "fugitiveblame",
				text = "Git Blame",
				text_align = "center",
				separator = true,
			},
			{
				filetype = "packer",
				text = "Packer",
				text_align = "center",
				separator = true,
			},
		},
		truncate_names = false,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		always_show_bufferline = false,
	},
})
