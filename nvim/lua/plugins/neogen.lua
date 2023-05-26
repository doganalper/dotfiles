return {
	"danymat/neogen",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = function()
		require('neogen').setup({

		})
	end,
	event = "VeryLazy",
	keys = function()
		vim.keymap.set('n', '<leader>jd', '<CMD>:Neogen func<cr>')
	end
}
