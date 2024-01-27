return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      -- extensions = { "neo-tree", "fugitive" },
      options = {
        icons_enabled = true,
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
        lualine_b = {
          {
            "filename",
            path = 4,
          },
        },
        lualine_c = {},
        lualine_x = {
          { "filetype", separator = "", padding = { right = 1 } },
        },
        lualine_y = { "diff", "diagnostics" },
      },
      inactive_sections = {
        lualine_c = {
          {
            "filename",
            path = 1,
          },
        },
        lualine_y = {
          { "filetype", separator = "", padding = { right = 0 } },
        },
      },
    })
  end,
}
