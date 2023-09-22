return {
	"f-person/auto-dark-mode.nvim",
	config = {
		update_interval = 15000, -- bu belki ram kullanımını arttırabilir çünkü sürekli çalışan bir interval var
		set_dark_mode = function()
			vim.api.nvim_set_option("background", "dark")
		end,
		set_light_mode = function()
			vim.api.nvim_set_option("background", "light")
		end,
	},
}
