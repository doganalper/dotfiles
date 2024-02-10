return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    local helpers = require("helpers");
    local is_transparent = false
    local dark_theme = "frappe"
    require("catppuccin").setup({
      transparent_background = is_transparent,
      flavour = dark_theme,
      background = { -- :h background
        light = "latte",
        dark = dark_theme,
      },
      integrations = {
        neotree = true,
        telescope = true,
        harpoon = true,
        mason = true,
        flash = true,
      },
      custom_highlights = function(colors)
        local transparent_background = { bg = colors.base }
        local returnValue = {
          -- CursorLineNr = { fg = colors.green },
          LineNr = { fg = colors.red },
          LspInlayHint = { bg = colors.base },

          -- NeoTree Related
          -- NeoTreeNormal = { bg = colors.text },
          NeoTreeGitAdded = { fg = colors.text },
          NeoTreeGitModified = { fg = colors.text },
          NeoTreeGitUntracked = { fg = colors.text },
          NeoTreeGitTracked = { fg = colors.text },

          -- Telescope Related
          TelescopePreviewNormal = { default = true, link = "TelescopeNormal" },
          TelescopePromptNormal = { default = true, link = "TelescopeNormal" },
          TelescopeResultsNormal = { default = true, link = "TelescopeNormal" },
          TelescopeBorder = { default = true, link = "TelescopeNormal" },
          TelescopePromptBorder = { default = true, link = "TelescopeBorder" },
          TelescopeResultsBorder = { default = true, link = "TelescopeBorder" },
          TelescopePreviewBorder = { default = true, link = "TelescopeBorder" },
        }

        if is_transparent == true then
          returnValue = helpers.concatTables(returnValue, {
            -- NeoTreeNormal = transparent_background,
            CmpNormal = { link = "TelescopeNormal" },
            -- NormalFloat = transparent_background,
            TreesitterContext = transparent_background,
            TelescopeNormal = transparent_background,
          })
        end

        return returnValue
      end,
      styles = {
        comments = { "italic" },
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
    })

    vim.cmd("colorscheme catppuccin")
  end,
}
