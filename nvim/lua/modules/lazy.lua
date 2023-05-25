local plugins = {
	{ import = "plugins.ufo" },
	{ import = "plugins.advanced-git-search" },
	{ import = "plugins.catppuccin" },
	{ import = "plugins.github-theme" },
	{ import = "plugins.barbecue" },
	{ import = "plugins.cmp" },
	{ import = "plugins.devicons" },
	{ import = "plugins.gitsigns" },
	{ import = "plugins.lsp-zero" },
	{ import = "plugins.lsp-kind" },
	{ import = "plugins.lua-snip" },
	{ import = "plugins.lualine" },
	{ import = "plugins.nvim-comment" },
	-- { import = "plugins.nvim-tree" },
	{import = 'plugins.neotree'},
	{ import = "plugins.telescope" },
	{ import = "plugins.todo-comments" },
	{ import = "plugins.treesitter" },
	{ import = "plugins.vim-go" },
	{ import = "plugins.wilder" },
	{ import = "plugins.vim-fugitive" },
	{ import = "plugins.null-ls" },
	{ import = "plugins.glance" },
	"nvim-lua/plenary.nvim",
	"jiangmiao/auto-pairs",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"windwp/nvim-ts-autotag",
	"lukas-reineke/indent-blankline.nvim",
}

local opts = {
	change_detection = {
		enabled = true,
		notify = false,
	},
}

require("lazy").setup(plugins, opts)
