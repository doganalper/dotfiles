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
      "<cmd>TodoTelescope theme=ivy initial_mode=insert previewer=false layout_config={bottom_pane={height=12}}<cr>",
      desc = "[T]o[D]o",
    },
  },
}
