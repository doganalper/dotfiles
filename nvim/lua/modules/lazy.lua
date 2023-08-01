local plugins = {
	{ import = "plugins.devicons" },
	{ import = "plugins.advanced-git-search" },
	{ import = "plugins.cmp" },
	{ import = "plugins.gitsigns" },
	{ import = "plugins.lsp-zero" },
	{ import = "plugins.lsp-kind" },
	{ import = "plugins.lua-snip" },
	{ import = "plugins.lualine" },
	{ import = "plugins.nvim-comment" },
	{ import = 'plugins.neotree' },
	{ import = "plugins.telescope" },
	{ import = "plugins.todo-comments" },
	{ import = "plugins.treesitter" },
	{ import = "plugins.vim-go" },
	{ import = "plugins.wilder" },
	{ import = "plugins.null-ls" },
	{ import = "plugins.glance" },
	{ import = "plugins.auto-pairs" },
	{ import = "plugins.catppuccin" },
	{ import = "plugins.colorizer" },
	{ import = "plugins.treesitter-context" },
	{ import = "plugins.flash" },
	{ import = "plugins.friendly-snippets" },
	"nvim-lua/plenary.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"windwp/nvim-ts-autotag",
	"lukas-reineke/indent-blankline.nvim",
	"tpope/vim-fugitive"
}

local opts = {
	change_detection = {
		enabled = true,
		notify = false,
	},
}

require("lazy").setup(plugins, opts)

-- POSSIBLE PLUGINS (check out later)
-- https://github.com/sindrets/diffview.nvim
