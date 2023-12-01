return {
  "hrsh7th/nvim-cmp",
  config = function()
    require("helpers")
    local lsp = require("lsp-zero")
    local luasnip = require("luasnip")
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    -- vim.api.nvim_set_hl(0, "Pmenu", { bg = "#FF0000" })

    local function formatForTailwindCSS(entry, vim_item)
      if vim_item.kind == "Color" and entry.completion_item.documentation then
        local _, _, r, g, b = string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
        if r then
          local color = string.format("%02x", r) .. string.format("%02x", g) .. string.format("%02x", b)
          local group = "Tw_" .. color
          if vim.fn.hlID(group) < 1 then
            vim.api.nvim_set_hl(0, group, { fg = "#" .. color })
          end
          vim_item.kind = "■" -- or "●" or anything
          vim_item.kind_hl_group = group
          return vim_item
        end
      end

      vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
      return vim_item
    end

    -- see: https://twitter.com/thdxr/status/1623769303819460608?s=20&t=l1K_q3dsJzl0tZ_GS4NHig
    cmp.setup({
      enabled = function()
        -- disable completion in telescope buffer
        local buftype = vim.api.nvim_buf_get_option(0, "buftype")
        if buftype == "prompt" then
          return false
        end

        -- disable completion in comments
        local context = require("cmp.config.context")
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == "c" then
          return true
        else
          return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
        end
      end,
      -- don't auto select item
      preselect = cmp.PreselectMode.None,
      mapping = ConcatTables(lsp.defaults.cmp_mappings(), {
        ["<CR>"] = cmp.mapping.confirm(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
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
        -- documentation = cmp.config.window.bordered({}),
        -- completion = cmp.config.window.bordered({}),
        -- completion = {
        -- 	winhighlight = "Normal:NormalFloat"
        -- }
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
        {
          name = "nvim_lsp",
          -- this is for filterin emmet outside of html tags
          -- TODO: this may be broken, check if anything goes wrong
          entry_filter = function(entry)
            -- if vim.bo.filetype == 'html' then
            -- 	return true
            -- end

            if entry:get_kind() == require("cmp.types").lsp.CompletionItemKind.Snippet then
              return false
            end

            -- local context = require("cmp.config.context")
            -- return not context.in_treesitter_capture("string") and
            -- not context.in_syntax_group("String")
            return true
          end,
        },
        {
          name = "luasnip",
        },
        { name = "crates" } -- TODO: load this lazily. see: https://github.com/Saecki/crates.nvim/wiki/Stable-documentation
      }),
    })
  end,
}
