return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  config = function()
    local neogen = require("neogen")

    neogen.setup({
      snippet_engine = "luasnip",
    })
  end,
  keys = {
    {
      "<leader>dgf",
      mode = { "n" },
      "<cmd>lua require('neogen').generate({ type = 'func' }) <cr>",
    },
    {
      "<leader>dgt",
      mode = { "n" },
      "<cmd>lua require('neogen').generate({ type = 'type' }) <cr>",
    },
  },
  version = "*",
  ft = "javascript",
}
