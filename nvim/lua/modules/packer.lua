-- todo: buraya bir hiyerarşi ekle fazla karışık.
vim.cmd([[packadd packer.nvim]])
return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use("tpope/vim-fugitive")

	use("nvim-lua/plenary.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.x",
	})

	use("jiangmiao/auto-pairs")
	use("terrortylor/nvim-comment")

	-- Nvim-cmp icons
	use("onsails/lspkind.nvim")

	-- Lsp
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
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
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/playground")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("windwp/nvim-ts-autotag")

	use({
		"gelguy/wilder.nvim",
	})

	-- Search and replace: https://github.com/nvim-pack/nvim-spectre
	-- use('windwp/nvim-spectre')

	-- File explorer
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			{
				"nvim-tree/nvim-web-devicons",
				as = "nvim-web-devicons",
			},
		},
		tag = "nightly",
	})

	-- Bottom line
	use({
		"nvim-lualine/lualine.nvim",
	})

	-- Buffers list on top
	use({
		"akinsho/bufferline.nvim",
		requires = "nvim-web-devicons",
	})

	-- Vim
	use("fatih/vim-go")

	-- Vertical lines
	use("lukas-reineke/indent-blankline.nvim")

	-- Themes
	use({
		"rose-pine/neovim",
		as = "rose-pine",
	})
	use({ "ellisonleao/gruvbox.nvim" })
	use("folke/tokyonight.nvim")
	use("JoosepAlviste/palenightfall.nvim")
	use("NTBBloodbath/sweetie.nvim")
	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})
end)
