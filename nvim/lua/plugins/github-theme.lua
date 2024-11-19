return {
  "projekt0n/github-nvim-theme",
  name = "github-theme",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("github-theme").setup({
      groups = {
        all = {
          Statusline = { bg = "#00ff8b", fg = "palette.red" },
          StatuslineNC = { bg = "#0aa08b", fg = "palette.red" },
        },
      },
      -- groups = function(c)
      --   return {
      --   }
      -- end,
    })
  end,
}
