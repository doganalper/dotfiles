require("helpers")
local lsp = require("lsp-zero")
local luasnip = require("luasnip")
local cmp = require("cmp")
local root_pattern = require("lspconfig").util.root_pattern
local lspkind = require("lspkind")

lsp.preset("recommended")

-- see: https://twitter.com/thdxr/status/1623769303819460608?s=20&t=l1K_q3dsJzl0tZ_GS4NHig
lsp.setup_nvim_cmp({
	mapping = ConcatTables(lsp.defaults.cmp_mappings(), {
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
			-- they way you will only jump inside the snippet region
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif HasWordsBefore() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	documentation = {
		border = { "", "", "", "", "", "", "", "" },
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = lspkind.cmp_format({
				mode = "symbol_text",
				maxwidth = 50,
				ellipsis_char = "...",
			})(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. strings[1] .. " "
			kind.menu = "[" .. entry.source.name .. "]"

			return kind
		end,
	},
	view = {
		entries = { name = "custom", selection_order = "near_cursor" },
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})

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
	on_attach = function(client, bufnr)
		print("hello tsserver")
	end,
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
