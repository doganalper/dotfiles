return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			javascript = { "prettier" },
			typescript = { "prettier" },
			vue = { "prettier" },
			typescriptreact = { "prettier" },
			astro = { "prettier" },
			javascriptreact = { "prettier" },
			html = { "prettier" },
			htmldjango = { "prettier" },
		},
	},
	event = "VeryLazy",
	keys = {
		{
			"gq",
			mode = { "n" },
			function()
				require("conform").format()
			end,
			desc = "Format File",
		},
	},
}
