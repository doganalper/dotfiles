return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  config = function()
    local gs = require("gitsigns")
    require("helpers")

    gs.setup({
      on_attach = function(bufnr)
        Map("n", "<leader>glc", gs.preview_hunk, { desc = "[G]it [L]ine [C]hanges" })

        Map("n", "<leader>gfd",  gs.diffthis, { desc = "[G]it [F]ile [D]iff" })

        Map("n", "<leader>ghr", gs.reset_hunk, { desc = "[G]it [H]unk [R]eset" })

        Map("n", "<leader>gnh", gs.next_hunk, { desc = "[G]it [N]ext [H]unk" })

        Map("n", "<leader>gph", gs.prev_hunk, { desc = "[G]it [P]rev [H]unk" })

        Map("n", "<leader>gfr", gs.reset_buffer, { desc = "[G]it [F]ile [R]eset" })

        Map("n", "<leader>gb", function()
          gs.blame_line({ full = true })
        end, { desc = "[G]it [B]lame" })
      end,
    })
  end,
}
