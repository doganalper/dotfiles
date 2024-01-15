return {
  "ThePrimeagen/harpoon",
  event = "BufRead",
  keys = {
    {
      "<leader>ha",
      mode = {"n"},
      "<cmd>lua require('harpoon.mark').add_file()<cr>",
      desc = "[H]arpoon [A]dd"
    },
    {
      "<leader>hl",
      mode = {"n"},
      "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
      desc = "[H]arpoon [L]ist"
    }
  }
}
