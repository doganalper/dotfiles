local function toggle_diffview(openCmd)
  local lib = require("diffview.lib")
  local view = lib.get_current_view()

  if view then
    vim.cmd.DiffviewClose()
  else
    openCmd()
  end
end

return {
 "sindrets/diffview.nvim",
  keys = {
    {
      "<leader>gfc",
      mode = { "n" },
      function()
        toggle_diffview(vim.cmd.DiffviewFileHistory)
      end,
      desc = "Space [G]it [F]ile [C]ommits",
    },
    {
      "<leader>gda",
      mode = { "n" },
      function()
        toggle_diffview(vim.cmd.DiffviewOpen)
      end,
      desc = "Space [D]iff [V]iew [A]ll",
    }
  }
}
