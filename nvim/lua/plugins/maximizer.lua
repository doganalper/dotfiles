return {
  "0x00-ketsu/maximizer.nvim",
  event = "VeryLazy",
  keys = function()
    vim.keymap.set("n", "<C-w>m", "<cmd>lua require('maximizer').toggle()<CR>", { desc = "Toggle [M]aximize Split" })
  end,
}
