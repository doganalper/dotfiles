return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  enabled = false,
  -- version = false, -- set this if you want to always pull the latest change
  opts = {
    provider = "copilot",
    auto_suggestions_provider = "copilot",
    -- hints = { enabled = true }
  },
  build = "make",
  -- build = "make BUILD_FROM_SOURCE=true",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "zbirenbaum/copilot.lua",
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
