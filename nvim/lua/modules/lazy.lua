local plugins = {
	"tpope/vim-fugitive",
	"lewis6991/gitsigns.nvim",
	"nvim-lua/plenary.nvim",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
	},
	{
		"aaronhallaert/advanced-git-search.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			-- to show diff splits and open commits in browser
			"tpope/vim-fugitive",
			-- to open commits in browser with fugitive
			"tpope/vim-rhubarb",
			-- OPTIONAL: to replace the diff from fugitive with diffview.nvim
			-- (fugitive is still needed to open in browser)
			-- "sindrets/diffview.nvim",
		},
	},
	"jiangmiao/auto-pairs",
	"terrortylor/nvim-comment",
	"onsails/lspkind.nvim",
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
		},
	},
	"nvim-treesitter/nvim-treesitter",
	"nvim-treesitter/playground",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"windwp/nvim-ts-autotag",
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			{
				"nvim-tree/nvim-web-devicons",
				name = "nvim-web-devicons",
			},
		},
		tag = "nightly",
	},
	"nvim-lualine/lualine.nvim",
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-web-devicons" },
	},
	{
		"fatih/vim-go",
		ft = "go",
	},
	"lukas-reineke/indent-blankline.nvim",
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
