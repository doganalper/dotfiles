local function maximize_status()
  return vim.t.maximized and " " or ""
end

return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      -- extensions = { "neo-tree", "fugitive" },
      options = {
        icons_enabled = false,
        global_status = true,
        theme = "catppuccin",
        component_separators = "",
        section_separators = "",
        disabled_filetypes = { "fugitiveblame", "neo-tree", "alpha" },
      },
      -- tabline = {
      --   lualine_a = {
      --     {
      --       "buffers",
      --       show_filename_only = false,
      --       use_mode_colors = false,
      --       separator = "",
      --     },
      --   },
      --   lualine_z = { { "branch", color = "lualine_a_normal" } },
      -- },
      sections = {
        lualine_b = { "location" },
        lualine_c = {
          "%=",
          {
            "filename",
            path = 4,
          },
        },
        lualine_x = {
          maximize_status,
        },
        lualine_y = { "diagnostics", "diff", "branch" },
        lualine_z = {},
      },
      inactive_sections = {
        lualine_c = {
          "%=",
          {
            "filename",
            path = 1,
          },
        },
      },
    })
  end,
}
