return {
  "hrsh7th/nvim-cmp",
  event = "BufRead",
  dependencies = {
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-path",
  },
  config = function()
    local helpers = require("helpers")
    local lsp = require("lsp-zero")
    local luasnip = require("luasnip")
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    local function formatForTailwindCSS(_, vim_item)
      vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
      return vim_item
    end

    -- see: https://twitter.com/thdxr/status/1623769303819460608?s=20&t=l1K_q3dsJzl0tZ_GS4NHig
    cmp.setup({
      -- completion = {
      --   -- TODO: Currently trying this for usability, trigger cmp to open on <c-e>
      --   autocomplete = false,
      -- },
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
      preselect = cmp.PreselectMode.None, -- don't auto select item
      mapping = helpers.concatTables(lsp.defaults.cmp_mappings(), {
        ["<CR>"] = cmp.mapping.confirm(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif helpers.hasWordsBefore() then
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
        completion = {
          winhighlight = "Normal:CmpNormal,FloatBorder:CmpNormal,CursorLine:PmenuSel",
        },
        documentation = {
          winhighlight = "Normal:CmpNormal,FloatBorder:CmpNormal",
        },
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind.cmp_format({
          mode = "text", -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
          maxwidth = 70, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          before = function(entry, vim_item)
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
          -- max_item_count = 50,
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
        { name = "crates" },
      }),
    })

    -- cmp for command completion instead of wilder.nvim
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })
  end,
}
