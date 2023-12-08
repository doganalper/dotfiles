-- https://github.com/DNLHC/glance.nvim
-- for seeing definitions/references/type definitions/implementation better
return {
  "dnlhc/glance.nvim",
  config = function()
    require("glance").setup({
      border = {
        enable = true,
        top_char = "―",
        bottom_char = "―",
      },
      folds = {
        fold_closed = ">",
        fold_open = "v",
      },
      hooks = {
        before_open = function(results, open, jump, method)
          local uri = vim.uri_from_bufnr(0)
          if #results == 1 then
            local target_uri = results[1].uri or results[1].targetUri
            if target_uri == uri then
              jump(results[1])
            else
              open(results)
            end
          else
            open(results)
          end
        end,
      },
    })
  end,
  event = "VeryLazy",
  keys = function()
    -- vim.keymap.set("n", "gd", "<CMD>Glance definitions<CR>", { desc = "[G]oto [D]efinition" })
    -- vim.keymap.set("n", "gr", "<CMD>Glance references<CR>")
    -- vim.keymap.set("n", "<leader>gtd", "<CMD>Glance type_definitions<CR>")
    -- vim.keymap.set("n", "gi", "<CMD>Glance implementations<CR>")
  end,
}
