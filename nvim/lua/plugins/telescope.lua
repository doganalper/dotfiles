return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.1",
	config = function()
		local commonDropdown = {
			previewer = false,
			theme = "dropdown",
		}

		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.6,
					},
				},
				prompt_prefix = ">  ",
			},
			pickers = {
				colorscheme = commonDropdown,
				oldfiles = commonDropdown,
				find_files = commonDropdown,
				buffers = commonDropdown,
			},
			extensions = {
				advanced_git_search = {
					diff_plugin = "fugitive",
					git_flags = {},
					git_diff_flags = {},
				},
			},
		})

		telescope.load_extension("advanced_git_search")
	end,
	keys = function()
		require("helpers")

		Bind("n", "<leader>o", "<cmd>Telescope find_files<cr>", { desc = "Space [O]pen" })
		Bind("n", "<leader>f", "<cmd>Telescope live_grep<cr>", { desc = "Space [F]ind" })
		Bind("n", "<leader>wf", "<cmd>Telescope grep_string<cr>", { desc = "[W]ord [F]ind" })
		Bind("n", "<leader>sd", "<cmd>Telescope diagnostics<cr>", { desc = "[S]how [D]iagnostics" })
		Bind("n", "<leader><leader>", "<cmd>Telescope<cr>", { desc = "Map space-space to see Telescope menu" })
		Bind("n", "<leader>rf", function()
			require("telescope.builtin").oldfiles({
				cwd_only = true,
			})
		end, { desc = "Space [R]ecent [F]iles" })
		Bind("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Space [G]it [S]tatus" })
		Bind("n", "<leader>gc", "<cmd>Telescope advanced_git_search search_log_content<cr>",
			{ desc = "Space [G]it [C]ommits" })
		Bind(
			"n",
			"<leader>gfc",
			"<cmd>Telescope advanced_git_search diff_commit_file<cr>",
			{ desc = "Space [G]it [F]ile [C]ommits" }
		)
		Bind("n", "<leader>bl", "<cmd>Telescope buffers<cr>", { desc = "[B]uffers [L]ist" })
	end
}
