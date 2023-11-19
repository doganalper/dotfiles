return {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  keys = function()
    vim.keymap.set("n", "<leader>ha", function()
      require("harpoon.mark").add_file()
    end, { desc = "[H]arpoon [A]dd" })
    vim.keymap.set("n", "<leader>hl", function()
      require("harpoon.ui").toggle_quick_menu()
    end, { desc = "[H]arpoon [A]dd" })
  end,
}
