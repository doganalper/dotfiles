-- https://github.com/DNLHC/glance.nvim
-- for seeing definitions/references/type definitions/implementation better
return {
	'dnlhc/glance.nvim',
	config = function()
		require('glance').setup({
			border = {
				enable = true,
				top_char = '―',
				bottom_char = '―',
			},
		})
	end,
	event = "VeryLazy",
	keys = function()
		vim.keymap.set("n", "gd", '<CMD>Glance definitions<CR>', { desc = "[G]oto [D]efinition" })
		vim.keymap.set('n', 'gr', '<CMD>Glance references<CR>')
		vim.keymap.set('n', '<leader>gtd', '<CMD>Glance type_definitions<CR>')
		vim.keymap.set('n', 'gi', '<CMD>Glance implementations<CR>')
	end
}
