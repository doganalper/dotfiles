return {
  "ThePrimeagen/harpoon",
  event = "BufRead",
  opts = {
    menu = {
      width = 90
    }
  },
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
    },
    {
      "]h",
      mode = {"n"},
      "<cmd>lua require('harpoon.ui').nav_next()<cr>",
      desc = "] [H]arpoon Next"
    },
    {
      "[h",
      mode = {"n"},
      "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
      desc = "] [H]arpoon Prev"
    }
  }
}
