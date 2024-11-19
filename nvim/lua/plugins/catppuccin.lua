return {
  "catppuccin/nvim",
  name = "catppuccin",
  -- enabled = false,
  priority = 1000,
  config = function()
    local helpers = require("helpers")
    local is_transparent = false
    local dark_theme = "macchiato"
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
          TelescopeNormal = { default = true, link = "NeoTreeNormal" },
          TelescopePreviewNormal = { default = true, link = "TelescopeNormal" },
          TelescopePromptNormal = { default = true, link = "TelescopeNormal" },
          TelescopeResultsNormal = { default = true, link = "TelescopeNormal" },
          TelescopeBorder = { default = true, link = "TelescopeNormal" },
          TelescopePromptBorder = { default = true, link = "TelescopeBorder" },
          TelescopeResultsBorder = { default = true, link = "TelescopeBorder" },
          TelescopePreviewBorder = { default = true, link = "TelescopeBorder" },
          CmpNormal = { link = "NeoTreeNormal" },

          -- DapUi
          DapBreakpoint = { fg = colors.red },
        }

        if is_transparent == true then
          returnValue = helpers.concatTables(returnValue, {
            -- NeoTreeNormal = transparent_background,
            CmpNormal = { link = "TelescopeNormal" },
            -- NormalFloat = transparent_background,
            TreesitterContext = transparent_background,
            TelescopeNormal = transparent_background,
            CursorColumn = { link = "CursorLine" },
          })
        end

        return returnValue
      end,
      color_overrides = {
        -- latte = {
        --   rosewater = "#c14a4a",
        --   flamingo = "#c14a4a",
        --   red = "#c14a4a",
        --   maroon = "#c14a4a",
        --   pink = "#945e80",
        --   mauve = "#945e80",
        --   peach = "#c35e0a",
        --   yellow = "#b47109",
        --   green = "#6c782e",
        --   teal = "#4c7a5d",
        --   sky = "#4c7a5d",
        --   sapphire = "#4c7a5d",
        --   blue = "#45707a",
        --   lavender = "#45707a",
        --   text = "#654735",
        --   subtext1 = "#73503c",
        --   subtext0 = "#805942",
        --   overlay2 = "#8c6249",
        --   overlay1 = "#8c856d",
        --   overlay0 = "#a69d81",
        --   surface2 = "#bfb695",
        --   surface1 = "#d1c7a3",
        --   surface0 = "#e3dec3",
        --   base = "#f9f5d7",
        --   mantle = "#f0ebce",
        --   crust = "#e8e3c8",
        -- },
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
  end,
}
