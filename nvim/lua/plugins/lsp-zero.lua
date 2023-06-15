return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
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
	config = function()
		require("helpers")
		local lsp = require("lsp-zero")
		local luasnip = require("luasnip")
		local cmp = require("cmp")
		local lsp_config = require("lspconfig")
		local root_pattern = lsp_config.util.root_pattern
		local lspkind = require("lspkind")

		lsp.preset("recommended")

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		lsp.set_preferences({
			set_lsp_keymaps = { omit = { "K", "<F4>", "<F2>", "gr", 'gi', 'gd' } },
			sign_icons = {
				error = "E",
				warn = "W",
				hint = "H",
				info = "I",
			},
		})

		-- see: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/lsp.md#disable-semantic-highlights
		lsp.set_server_config({
			on_init = function(client)
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})

		lsp.on_attach(function(client, bufnr)
			vim.keymap.set("n", "<leader>i", vim.lsp.buf.hover, { buffer = bufnr, desc = "Space [I]nfo" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,
				{ buffer = bufnr, desc = "Space [R]e[n]ame" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,
				{ buffer = bufnr, desc = "Space [C]ode [A]ction" })
		end)

		lsp_config.eslint.setup({
			capabilities = capabilities,
		})

		lsp_config.tsserver.setup({
			settings = {
				completions = {
					completeFunctionCalls = true,
				},
			},
			capabilities = capabilities,
		})

		-- attach vetur when there's a vetur file
		lsp_config.vuels.setup({
			root_dir = root_pattern("vetur*"),
			capabilities = capabilities,
		})

		-- attach volar when there's a vite file
		lsp_config.volar.setup({
			root_dir = root_pattern("vite*"),
			capabilities = capabilities,
		})

		lsp_config.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" }
					}
				}
			},
			capabilities = capabilities,
		})

		local htmlFileTypes = {
			"html",
			"vue",
			"astro",
			"typescriptreact",
			"javascriptreact",
		}
		lsp_config.html.setup({
			filetypes = htmlFileTypes,
			capabilities = capabilities,
		})
		lsp_config.emmet_ls.setup({
			filetypes = {
				"astro",
				"html",
				"typescriptreact",
				"javascriptreact",
			},
			capabilities = capabilities,
		})

		-- lsp.format_on_save({
		lsp.format_mapping('gq', {
			format_opts = {
				async = false,
				timeout_ms = 10000,
			},
			servers = {
				['lua_ls'] = { 'lua' },
				['null-ls'] = { 'javascript', 'typescript', 'vue', 'typescriptreact', 'astro',
					'javascriptreact' },
			}
		})

		lsp.setup()

		vim.diagnostic.config({
			virtual_text = true,
		})
	end,
	keys = function()
		-- Vim Related Mappings
		vim.keymap.set("n", "<leader>LR", function()
			vim.cmd("LspRestart")
			print("Lsp Restarted")
		end, { desc = "Space [L]sp [R]estart", silent = false })
	end
}
