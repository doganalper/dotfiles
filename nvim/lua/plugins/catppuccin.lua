return {
  "catppuccin/nvim",
  name = "catppuccin",
  enabled = true,
  priority = 1000,
  config = function()
    local helpers = require("helpers")
    local is_transparent = false
    local dark_theme = "mocha"
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
          -- NeoTreeNormal = { bg = colors.base },
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
          CmpNormal = { link = "NeoTreeNormal" },
        }

        if is_transparent == true then
          returnValue = helpers.concatTables(returnValue, {
            -- NeoTreeNormal = transparent_background,
            CmpNormal = { link = "TelescopeNormal" },
            NormalFloat = transparent_background,
            TreesitterContext = transparent_background,
            TelescopeNormal = transparent_background,
          })
        end

        return returnValue
      end,
      color_overrides = {
        -- mocha = {
        --   rosewater = "#ea6962",
        --   flamingo = "#ea6962",
        --   red = "#ea6962",
        --   maroon = "#ea6962",
        --   pink = "#d3869b",
        --   mauve = "#d3869b",
        --   peach = "#e78a4e",
        --   yellow = "#d8a657",
        --   green = "#a9b665",
        --   teal = "#89b482",
        --   sky = "#89b482",
        --   sapphire = "#89b482",
        --   blue = "#7daea3",
        --   lavender = "#7daea3",
        --   text = "#ebdbb2",
        --   subtext1 = "#d5c4a1",
        --   subtext0 = "#bdae93",
        --   overlay2 = "#a89984",
        --   overlay1 = "#928374",
        --   overlay0 = "#595959",
        --   surface2 = "#4d4d4d",
        --   surface1 = "#404040",
        --   surface0 = "#292929",
        --   base = "#1d2021",
        --   mantle = "#191b1c",
        --   crust = "#141617",
        -- },
        -- latte = {
        --   rosewater = "#c14a4a",
        --   flamingo = "#c14a4a",
        --   pink = "#945e80",
        --   mauve = "#945e80",
        --   red = "#c14a4a",
        --   maroon = "#c14a4a",
        --   peach = "#c35e0a",
        --   yellow = "#a96b2c",
        --   green = "#6c782e",
        --   teal = "#4c7a5d",
        --   sky = "#4c7a5d",
        --   sapphire = "#4c7a5d",
        --   blue = "#45707a",
        --   lavender = "#45707a",
        --   text = "#654735",
        --   subtext1 = "#7b5d44",
        --   subtext0 = "#8f6f56",
        --   overlay2 = "#a28368",
        --   overlay1 = "#b6977a",
        --   overlay0 = "#c9aa8c",
        --   surface2 = "#A79C86",
        --   surface1 = "#C9C19F",
        --   surface0 = "#DFD6B1",
        --   base = "#fbf1c7",
        --   mantle = "#F3EAC1",
        --   crust = "#E7DEB7",
        -- },
      },
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

    -- vim.cmd("colorscheme catppuccin")
  end,
}
