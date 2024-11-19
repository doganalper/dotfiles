return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  -- event = "VeryLazy",
  config = function()
    require("neo-tree").setup({
      default_component_configs = {
        git_status = {
          symbols = {
            -- Change type
            added = "",
            deleted = "",
            modified = "",
            renamed = "",
            -- Status type
            untracked = "",
            ignored = "",
            unstaged = "",
            staged = "",
            conflict = "",
          },
        },
        highlights = {
          hint = "",
          info = "",
          warn = "",
          error = "",
        },
        last_modified = {
          enabled = false,
        },
      },
      document_symbols = {
        window = {
          mappings = {
            ["o"] = "toggle_node",
          },
        },
      },
      sources = { "filesystem", "document_symbols" },
      filesystem = {
        window = {
          mappings = {
            ["H"] = "toggle_hidden",
            ["W"] = "close_all_nodes",
            ["x"] = "open_split",
            ["v"] = "open_vsplit",
            ["X"] = "cut_to_clipboard",
          },
        },
        filtered_items = {
          hide_gitignored = false,
          hide_dotfiles = false,
        },
        follow_current_file = {
          enabled = true,
        },
        components = {
          -- icon = function(config, node, state)
          --   if node.type == "file" then
          --     return {
          --       text = " ",
          --       highlight = config.highlight,
          --     }
          --   end

          --   if node.type == "directory" then
          --     return {
          --       text = "• ",
          --       highlight = config.highlight,
          --     }
          --   end
          --   return require("neo-tree.sources.common.components").icon(config, node, state)
          -- end,
        },
      },
      use_popups_for_input = true,
      -- filesystem = {
      -- }),
    })
  end,
  keys = {
    {
      "<leader>1",
      mode = { "n" },
      "<cmd>Neotree toggle reveal right<cr>",
    },
    {
      "<leader>2",
      mode = { "n" },
      "<cmd>Neotree toggle reveal right document_symbols<cr>",
    },
  },
}
