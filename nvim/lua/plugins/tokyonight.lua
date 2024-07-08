return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",
    day_brightness = 0.3,
    -- transparent = true,
    on_highlights = function(hl, colors)
      hl.LineNrBelow = { fg = colors.white }
      hl.LineNrAbove = { fg = colors.white }
      hl.CursorLineNr = { fg = colors.red }
      -- hl.LspInlayHint = { bg = colors.base }

      -- NeoTree Related
      -- NeoTreeNormal = { bg = colors.base },
      hl.NeoTreeGitAdded = { link = "NeoTreeFileName" }
      hl.NeoTreeGitModified = { link = "NeoTreeFileName" }
      hl.NeoTreeGitUntracked = { link = "NeoTreeFileName" }
      hl.NeoTreeGitTracked = { link = "NeoTreeFileName" }

      -- Telescope Related
      hl.TelescopePreviewNormal = { default = true, link = "TelescopeNormal" }
      hl.TelescopePromptNormal = { default = true, link = "TelescopeNormal" }
      hl.TelescopeResultsNormal = { default = true, link = "TelescopeNormal" }
      hl.TelescopeBorder = { default = true, link = "TelescopeNormal" }
      hl.TelescopePromptBorder = { default = true, link = "TelescopeBorder" }
      hl.TelescopeResultsBorder = { default = true, link = "TelescopeBorder" }
      hl.TelescopePreviewBorder = { default = true, link = "TelescopeBorder" }
      hl.CmpNormal = { link = "NeoTreeNormal" }
    end,
  },
}
