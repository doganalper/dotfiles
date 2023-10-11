return {
	"szw/vim-maximizer",
	event = "VeryLazy",
	keys = function()
		vim.keymap.set("n", "<C-w>m", "<cmd>MaximizerToggle<cr>", { desc = "Toggle [M]aximize Split" })
	end,
}
