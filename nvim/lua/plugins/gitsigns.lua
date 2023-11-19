return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gs = require("gitsigns")

    gs.setup({
      on_attach = function(bufnr)
        vim.keymap.set("n", "<leader>glc", gs.preview_hunk)

        vim.keymap.set("n", "<leader>gb", function()
          gs.blame_line({ full = true })
        end, { desc = "[G]it [B]lame" })
      end,
    })
  end,
}
