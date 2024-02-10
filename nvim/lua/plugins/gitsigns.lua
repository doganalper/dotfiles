return {
  "lewis6991/gitsigns.nvim",
  event = "BufRead",
  config = function()
    local gs = require("gitsigns")
    local helpers = require("helpers")

    gs.setup({
      on_attach = function()
        helpers.map("n", "<leader>glc", gs.preview_hunk, { desc = "[G]it [L]ine [C]hanges" })

        helpers.map("n", "<leader>gfd", gs.diffthis, { desc = "[G]it [F]ile [D]iff" })

        helpers.map("n", "<leader>ghr", gs.reset_hunk, { desc = "[G]it [H]unk [R]eset" })

        helpers.map("n", "<leader>gnh", gs.next_hunk, { desc = "[G]it [N]ext [H]unk" })

        helpers.map("n", "<leader>gph", gs.prev_hunk, { desc = "[G]it [P]rev [H]unk" })

        helpers.map("n", "<leader>gfr", gs.reset_buffer, { desc = "[G]it [F]ile [R]eset" })

        helpers.map("n", "<leader>gb", function()
          gs.blame_line({ full = true })
        end, { desc = "[G]it [B]lame" })
      end,
    })
  end,
}
