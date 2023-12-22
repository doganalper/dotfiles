return {
'kkoomen/vim-doge',
  event = "BufRead",
  config = function()
    vim.cmd('call doge#install()')
  end,
  keys = {
    {
      "<leader>dg",
      mode = {"n"},
      "<cmd>DogeGenerate<cr>",
      desc = "[D]ocument [G]enerate"
    }
  }
}
