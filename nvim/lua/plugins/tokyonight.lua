return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    transparent = false,
    style = "moon",
    on_highlights = function(hl, colors)
      hl.LineNrBelow = { fg = colors.grey }
      hl.LineNrAbove = { fg = colors.grey }
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
