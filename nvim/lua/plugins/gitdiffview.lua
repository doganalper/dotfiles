local function toggle_diffview(openCmd, closeCmd)
  local lib = require("diffview.lib")
  local view = lib.get_current_view()
  if view then
    closeCmd()
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
        toggle_diffview(function()
          vim.cmd.DiffviewFileHistory("%")
        end, vim.cmd.DiffviewClose)
      end,
      desc = "Space [G]it [F]ile [C]ommits",
    },
    {
      "<leader>gda",
      mode = { "n" },
      function()
        toggle_diffview(vim.cmd.DiffviewOpen, vim.cmd.DiffviewClose)
      end,
      desc = "Space [G]it [D]iff [A]ctive File",
    },
  },
}
