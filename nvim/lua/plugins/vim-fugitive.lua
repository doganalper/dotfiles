return {
	"tpope/vim-fugitive",
	keys = function()
		require("helpers")

		local function GitBlame()
			if vim.bo.filetype == "fugitiveblame" then
				vim.cmd("x")
			else
				vim.cmd("Git blame")
			end
		end
		-- Extension for git commits see:https://github.com/aaronhallaert/advanced-git-search.nvim
		Bind("n", "<leader>gb", GitBlame, { desc = "[G]it [B]lame" })
	end
}
