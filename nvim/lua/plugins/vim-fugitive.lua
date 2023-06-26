return {
	"tpope/vim-fugitive",
	keys = function()
		-- Extension for git commits see:https://github.com/aaronhallaert/advanced-git-search.nvim
		vim.keymap.set("n", "<leader>gb", function()
			if vim.bo.filetype == "fugitiveblame" then
				vim.cmd("x")
			else
				vim.cmd("Git blame")
			end
		end, { desc = "[G]it [B]lame" })
	end
}
