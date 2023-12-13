return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  config = function()
    local gs = require("gitsigns")
    require("helpers")

    gs.setup({
      on_attach = function(bufnr)
        Map("n", "<leader>glc", gs.preview_hunk, { desc = "[G]it [L]ine [C]hanges" })

        Map("n", "<leader>gfc",  gs.diffthis, { desc = "[G]it [F]ile [C]hanges" })

        Map("n", "<leader>grh", gs.reset_hunk, { desc = "[G]it [R]eset [H]unk" })

        Map("n", "<leader>gnh", gs.next_hunk, { desc = "[G]it [N]ext [H]unk" })

        Map("n", "<leader>gph", gs.prev_hunk, { desc = "[G]it [P]rev [H]unk" })

        Map("n", "<leader>grf", gs.reset_buffer, { desc = "[G]it [R]eset [F]ile" })

        Map("n", "<leader>gb", function()
          gs.blame_line({ full = true })
        end, { desc = "[G]it [B]lame" })
      end,
    })
  end,
}
