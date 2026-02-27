return {
  "hrsh7th/nvim-cmp",
  event = "BufRead",
  dependencies = {
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-path",
    -- {
    --   "MattiasMTS/cmp-dbee",
    --   dependencies = {
    --     { "kndndrj/nvim-dbee" },
    --   },
    --   ft = "sql",
    --   opts = {},
    -- },
  },
  config = function()
    local helpers = require("helpers")
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
      mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
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
      },
      window = {
        completion = vim.tbl_extend("force", cmp.config.window.bordered(), {
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        }),
        documentation = vim.tbl_extend("force", cmp.config.window.bordered(), {
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        }),
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      formatting = {
        fields = { "icon", "abbr" },
        format = lspkind.cmp_format({
          maxwidth = {
            -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            -- can also be a function to dynamically calculate max width such as
            -- menu = function() return math.floor(0.45 * vim.o.columns) end,
            menu = 50, -- leading text (labelDetails)
            abbr = 50, -- actual suggestion item
          },
          ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          show_labelDetails = true, -- show labelDetails in menu. Disabled by default

          -- The function below will be called before any actual modifications from lspkind
          -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
          before = function(entry, vim_item)
            -- ...
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
        { name = "vim-dadbod-completion" },
        -- { name = "cmp-dbee" },
        { name = "copilot" },
        {
          name = "nvim_lsp",
          max_item_count = 25,
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
