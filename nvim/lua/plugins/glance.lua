-- https://github.com/DNLHC/glance.nvim
-- for seeing definitions/references/type definitions/implementation better
return {
	'dnlhc/glance.nvim',
	config = function()
		require('glance').setup({
			border = {
				enable = true
			},
		})
	end,
	event = "VeryLazy",
	keys = function()
		require("helpers")

		Bind("n", "gd", '<CMD>Glance definitions<CR>', { desc = "[G]oto [D]efinition" })
		Bind('n', 'gr', '<CMD>Glance references<CR>')
		Bind('n', '<leader>gtd', '<CMD>Glance type_definitions<CR>')
		Bind('n', 'gi', '<CMD>Glance implementations<CR>')
	end
}
