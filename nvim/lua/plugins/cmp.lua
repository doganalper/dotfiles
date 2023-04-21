require("helpers")
local lsp = require("lsp-zero")
local luasnip = require("luasnip")
local cmp = require("cmp")
local lspkind = require("lspkind")

local function formatForTailwindCSS(entry, vim_item)
	if vim_item.kind == "Color" and entry.completion_item.documentation then
		local _, _, r, g, b = string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
		if r then
			local color = string.format("%02x", r) .. string.format("%02x", g) .. string.format("%02x", b)
			local group = "Tw_" .. color
			if vim.fn.hlID(group) < 1 then
				vim.api.nvim_set_hl(0, group, { fg = "#" .. color })
			end
			vim_item.kind = "●" -- or "■" or anything
			vim_item.kind_hl_group = group
			return vim_item
		end
	end
	-- vim_item.kind = icons[vim_item.kind] and (icons[vim_item.kind] .. vim_item.kind) or vim_item.kind
	-- or just show the icon
	vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
	return vim_item
end

-- see: https://twitter.com/thdxr/status/1623769303819460608?s=20&t=l1K_q3dsJzl0tZ_GS4NHig
cmp.setup({
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
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = lspkind.cmp_format({
			mode = "symbol_text", -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
			maxwidth = 70, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			before = function(entry, vim_item)
				vim_item.menu = "(" .. vim_item.kind .. ")"
				vim_item.dup = ({
					nvim_lsp = 0,
					path = 0,
				})[entry.source.name] or 0
				vim_item = formatForTailwindCSS(entry, vim_item) -- for tailwind css autocomplete
				return vim_item
			end,
		}),
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		-- { name = "nvim_lsp" },
		-- change trigger count because tailwindlsp is very laggy see:https://www.reddit.com/r/neovim/comments/zkj1d8/how_do_you_handle_laggyfreezing_autocompletion/
		{ name = "nvim_lsp", keyword_length = 3, group_index = 1, max_item_count = 20 },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})
