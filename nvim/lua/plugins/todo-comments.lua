return {
  "folke/todo-comments.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  config = true,
  keys = {
    {
      "<leader>td",
      mode = { "n" },
      "<cmd>TodoQuickFix<cr>",
-- initial_mode=insert previewer=false layout_config={bottom_pane={height=12}}
      desc = "[T]o[D]o",
    },
  },
}
