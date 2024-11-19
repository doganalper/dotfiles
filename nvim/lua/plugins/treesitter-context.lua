return {
  "nvim-treesitter/nvim-treesitter-context",
  enabled = false,
  opts = {
    enable = true,
    multiline_threshold = 1,
    -- separator = "-",
    -- mode = 'topline'
  },
  event = "VeryLazy",
  keys = {
    {
      "gu",
      mode = { "n" },
      "<cmd>lua require('treesitter-context').go_to_context()<cr>",
      desc = "[G]o [U]pper [C]ontext",
    },
  },
}
