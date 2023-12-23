return {
  "kkoomen/vim-doge",
  -- event = "BufRead",
  config = function()
    vim.cmd("call doge#install()")
  end,
  -- enabled = false,
  keys = {
    {
      "<leader>dg",
      mode = { "n" },
      "<cmd>DogeGenerate<cr>",
      desc = "[D]ocument [G]enerate",
    },
  },
  ft = { "javascript", "typescript", "rust" },
}
