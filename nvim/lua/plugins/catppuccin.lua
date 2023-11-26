return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    local is_transparent = false
    local dark_theme = "frappe"
    require("catppuccin").setup({
      transparent_background = is_transparent,
      flavour = dark_theme,
      background = { -- :h background
        light = "latte",
        dark = dark_theme,
      },
      custom_highlights = function(colors)
        local transparent_background = { bg = colors.base }
        return {
          CursorLineNr = { fg = colors.green },
          LineNr = { fg = colors.red },
          TreesitterContext = transparent_background,
          LspInlayHint = { bg = colors.base },
          -- NormalFloat = transparent_background,

          -- Glance
          -- GlancePreviewNormal = transparent_background,
          -- GlanceListNormal = transparent_background,
          -- GlanceListBorderBottom = transparent_background,
          -- GlancePreviewBorderBottom = transparent_background,
          -- GlanceBorderTop = transparent_background,

          -- NeoTree Related
          NeoTreeGitAdded = { fg = colors.text },
          NeoTreeGitModified = { fg = colors.text },
          NeoTreeGitUntracked = { fg = colors.text },
          NeoTreeGitTracked = { fg = colors.text },

          -- Telescope Related
          -- TelescopeNormal = transparent_background,
          TelescopePreviewNormal = { default = true, link = "TelescopeNormal" },
          TelescopePromptNormal = { default = true, link = "TelescopeNormal" },
          TelescopeResultsNormal = { default = true, link = "TelescopeNormal" },
          TelescopeBorder = { default = true, link = "TelescopeNormal" },
          TelescopePromptBorder = { default = true, link = "TelescopeBorder" },
          TelescopeResultsBorder = { default = true, link = "TelescopeBorder" },
          TelescopePreviewBorder = { default = true, link = "TelescopeBorder" },
        }
      end,
      -- color_overrides = {
      -- 	mocha = {
      -- 		rosewater = "#EA6962",
      -- 		flamingo = "#EA6962",
      -- 		pink = "#D3869B",
      -- 		mauve = "#D3869B",
      -- 		red = "#EA6962",
      -- 		maroon = "#EA6962",
      -- 		peach = "#BD6F3E",
      -- 		yellow = "#D8A657",
      -- 		green = "#A9B665",
      -- 		teal = "#89B482",
      -- 		sky = "#89B482",
      -- 		sapphire = "#89B482",
      -- 		blue = "#7DAEA3",
      -- 		lavender = "#7DAEA3",
      -- 		text = "#D4BE98",
      -- 		subtext1 = "#BDAE8B",
      -- 		subtext0 = "#A69372",
      -- 		overlay2 = "#8C7A58",
      -- 		overlay1 = "#735F3F",
      -- 		overlay0 = "#958272",
      -- 		surface2 = "#4B4F51",
      -- 		surface1 = "#2A2D2E",
      -- 		surface0 = "#232728",
      -- 		base = "#1D2021",
      -- 		mantle = "#191C1D",
      -- 		crust = "#151819",
      -- 	},
      -- 	latte = {
      -- 		rosewater = "#c14a4a",
      -- 		flamingo = "#c14a4a",
      -- 		pink = "#945e80",
      -- 		mauve = "#945e80",
      -- 		red = "#c14a4a",
      -- 		maroon = "#c14a4a",
      -- 		peach = "#c35e0a",
      -- 		yellow = "#a96b2c",
      -- 		green = "#6c782e",
      -- 		teal = "#4c7a5d",
      -- 		sky = "#4c7a5d",
      -- 		sapphire = "#4c7a5d",
      -- 		blue = "#45707a",
      -- 		lavender = "#45707a",
      -- 		text = "#654735",
      -- 		subtext1 = "#7b5d44",
      -- 		subtext0 = "#8f6f56",
      -- 		overlay2 = "#a28368",
      -- 		overlay1 = "#b6977a",
      -- 		overlay0 = "#c9aa8c",
      -- 		surface2 = "#A79C86",
      -- 		surface1 = "#C9C19F",
      -- 		surface0 = "#DFD6B1",
      -- 		base = "#fbf1c7",
      -- 		mantle = "#F3EAC1",
      -- 		crust = "#E7DEB7",
      -- 	},
      -- 	frappe = {
      -- 		rosewater = "#efc9c2",
      -- 		flamingo = "#ebb2b2",
      -- 		pink = "#f2a7de",
      -- 		mauve = "#b889f4",
      -- 		red = "#ea7183",
      -- 		maroon = "#ea838c",
      -- 		peach = "#f39967",
      -- 		yellow = "#eaca89",
      -- 		green = "#96d382",
      -- 		teal = "#78cec1",
      -- 		sky = "#91d7e3",
      -- 		sapphire = "#68bae0",
      -- 		blue = "#739df2",
      -- 		lavender = "#a0a8f6",
      -- 		text = "#b5c1f1",
      -- 		subtext1 = "#a6b0d8",
      -- 		subtext0 = "#959ec2",
      -- 		overlay2 = "#848cad",
      -- 		overlay1 = "#717997",
      -- 		overlay0 = "#63677f",
      -- 		surface2 = "#505469",
      -- 		surface1 = "#3e4255",
      -- 		surface0 = "#2c2f40",
      -- 		base = "#1a1c2a",
      -- 		mantle = "#141620",
      -- 		crust = "#0e0f16",
      -- 	},
      -- },
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
