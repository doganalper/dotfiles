return {
  "nvim-treesitter/nvim-treesitter-context",
  opts = {
    enable = true,
    -- separator = "_",
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
