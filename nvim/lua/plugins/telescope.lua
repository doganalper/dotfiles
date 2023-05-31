return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.1",
	config = function()
		require('helpers')
		local commonDropdown = {
			previewer = false,
			theme = "dropdown",
		}

		local telescope = require("telescope")

		local filePicker = ConcatTables(commonDropdown, {
			hidden = true,
		})

		telescope.setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.6,
					},
				},
				prompt_prefix = " > ",
			},
			pickers = {
				colorscheme = commonDropdown,
				oldfiles = filePicker,
				find_files = filePicker,
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
		vim.keymap.set("n", "<leader>o", "<cmd>Telescope find_files<cr>", { desc = "Space [O]pen" })
		vim.keymap.set("n", "<leader>f", "<cmd>Telescope live_grep<cr>", { desc = "Space [F]ind" })
		vim.keymap.set("n", "<leader>wf", "<cmd>Telescope grep_string<cr>", { desc = "[W]ord [F]ind" })
		vim.keymap.set("n", "<leader>sd", "<cmd>Telescope diagnostics<cr>", { desc = "[S]how [D]iagnostics" })
		vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope<cr>",
			{ desc = "Map space-space to see Telescope menu" })
		vim.keymap.set("n", "<leader>rf", function()
			require("telescope.builtin").oldfiles({
				cwd_only = true,
			})
		end, { desc = "Space [R]ecent [F]iles" })
		vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Space [G]it [S]tatus" })
		vim.keymap.set("n", "<leader>gc", "<cmd>Telescope advanced_git_search search_log_content<cr>",
			{ desc = "Space [G]it [C]ommits" })
		vim.keymap.set(
			"n",
			"<leader>gfc",
			"<cmd>Telescope advanced_git_search diff_commit_file<cr>",
			{ desc = "Space [G]it [F]ile [C]ommits" }
		)
		vim.keymap.set("n", "<leader>bl", "<cmd>Telescope buffers<cr>", { desc = "[B]uffers [L]ist" })
	end
}
