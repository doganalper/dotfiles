return {
	"f-person/auto-dark-mode.nvim",
	config = {
		update_interval = 3000, -- bu belki ram kullanımını arttırabilir çünkü sürekli çalışan bir interval var
		set_dark_mode = function()
			vim.api.nvim_set_option("background", "dark")
			-- vim.cmd("colorscheme gruvbox")
		end,
		set_light_mode = function()
			vim.api.nvim_set_option("background", "light")
			-- vim.cmd("colorscheme gruvbox")
		end,
	},
}
