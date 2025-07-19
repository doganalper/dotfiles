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

    cmp.setup({
      enabled = function()
        local buftype = vim.api.nvim_buf_get_option(0, "buftype")
        if buftype == "prompt" then
          return false
        end

        local context = require("cmp.config.context")
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
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel",
        },
        documentation = {
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel",
        },
      },
      formatting = {
        fields = { "kind", "abbr" },
        format = lspkind.cmp_format({
          mode = "symbol",
          maxwidth = 70,
          symbol_map = {
            Copilot = "",
          },
          ellipsis_char = "...",
        }),
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      sources = cmp.config.sources({
        { name = "vim-dadbod-completion" },
        { name = "copilot" },
        {
          name = "nvim_lsp",
          max_item_count = 25,
          entry_filter = function(entry)
            if entry:get_kind() == require("cmp.types").lsp.CompletionItemKind.Snippet then
              return false
            end

            return true
          end,
        },
        {
          name = "luasnip",
        },
      }),
    })

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
