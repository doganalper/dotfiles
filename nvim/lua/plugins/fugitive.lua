return {
	"tpope/vim-fugitive",
	event="VeryLazy",
	keys = function() 
		vim.keymap.set('n', 'GG', '<CMD>G<CR>')
	end
}
