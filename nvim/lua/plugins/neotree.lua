return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	event = "VeryLazy",
	config = function()
		require('neo-tree').setup({
			default_component_configs = {
				git_status = {
					symbols = {
						-- Change type
						added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
						modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
						deleted   = "✖", -- this can only be used in the git_status source
						renamed   = "", -- this can only be used in the git_status source
						-- Status type
						untracked = "U",
						ignored   = "",
						-- unstaged  = "",
						unstaged  = "M",
						staged    = "S",
						conflict  = "",
					}
				},
			},
			filesystem = {
				filtered_items = {
					hide_gitignored = false,
					hide_dotfiles = false,
				},
				follow_current_file = true
			},
			use_popups_for_input = false,
			window = {
				mappings = {
					["H"] = "toggle_hidden",
					["W"] = "close_all_nodes",
					["v"] = "open_split",
					["h"] = "open_vsplit",
				}
			},
		}
		)
	end,
	keys = function()
		vim.keymap.set('n', '<leader>1', "<cmd>Neotree toggle<cr>")
	end
}
