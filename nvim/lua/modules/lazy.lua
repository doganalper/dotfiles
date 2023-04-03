local plugins = {
	"tpope/vim-fugitive",
	"nvim-lua/plenary.nvim",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
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
	"fatih/vim-go",
	"lukas-reineke/indent-blankline.nvim",
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
