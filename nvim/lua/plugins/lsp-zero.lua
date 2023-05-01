return {
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
	config = function()
		require("helpers")
		local lsp = require("lsp-zero")
		local luasnip = require("luasnip")
		local cmp = require("cmp")
		local root_pattern = require("lspconfig").util.root_pattern
		local lspkind = require("lspkind")

		lsp.preset("recommended")

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		lsp.set_preferences({
			set_lsp_keymaps = { omit = { "K", "<F4>", "<F2>", "gr" } },
			sign_icons = {
				error = "E",
				warn = "W",
				hint = "H",
				info = "I",
			},
		})

		lsp.on_attach(function(client, bufnr)
			Bind("n", "<leader>i", vim.lsp.buf.hover, { buffer = bufnr, desc = "Space [I]nfo" })
			Bind("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Space [R]e[n]ame" })
			Bind("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Space [C]ode [A]ction" })
			Bind("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "[G]oto [D]efinition" })
			Bind(
				"n",
				"<leader>gtd",
				vim.lsp.buf.type_definition,
				{ buffer = bufnr, desc = "[G]oto [T]ype [D]efinition" }
			)
			Bind("n", "gr", function()
				vim.api.nvim_command("set switchbuf+=usetab,newtab")
				vim.lsp.buf.references()
			end, { buffer = bufnr, desc = "[G]oto [R]eferences" })
		end)

		lsp.configure("eslint", {
			on_attach = function()
				-- Map space-ef to eslintfix
				Bind(
					"n",
					"<leader>ef",
					"<cmd>EslintFixAll<cr>",
					{ noremap = true, silent = false, desc = "Space [E]slint [F]ix" }
				)
			end,
			capabilities = capabilities,
		})

		lsp.configure("tsserver", {
			settings = {
				completions = {
					completeFunctionCalls = true,
				},
			},
			capabilities = capabilities,
		})

		-- attach vetur when there's a vetur file
		lsp.configure("vuels", {
			root_dir = root_pattern("vetur*"),
			capabilities = capabilities,
		})

		-- attach volar when there's a vite file
		lsp.configure("volar", {
			root_dir = root_pattern("vite*"),
			capabilities = capabilities,
		})

		lsp.configure("lua_ls", {
			on_attach = function()
				vim.api.nvim_create_autocmd("BufWritePost", {
					group = vim.api.nvim_create_augroup("Lua Format", { clear = true }),
					callback = function()
						vim.api.nvim_command("silent !stylua -g '*.lua' -- .")
					end,
				})
			end,
			capabilities = capabilities,
		})

		local htmlFileTypes = {
			"html",
			"vue",
			"astro",
			"typescriptreact",
			"javascriptreact",
		}
		lsp.configure("html", {
			filetypes = htmlFileTypes,
			capabilities = capabilities,
		})

		lsp.configure("emmet_ls", {
			filetypes = htmlFileTypes,
			capabilities = capabilities,
		})

		lsp.setup()

		vim.diagnostic.config({
			virtual_text = true,
		})
	end,
}
