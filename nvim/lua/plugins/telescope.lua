return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  dependencies = {
    "aaronhallaert/advanced-git-search.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-fugitive",
      "tpope/vim-rhubarb",
    },
  },
  event = "VeryLazy",
  config = function()
    require("helpers")
    local commonDropdown = {
      previewer = false,
      theme = "dropdown",
    }

    local telescope = require("telescope")

    local filePicker = ConcatTables(commonDropdown, {
      hidden = true,
      no_ignore = false,
    })

    telescope.setup({
      defaults = {
        -- layout_strategy = "vertical",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.5,
          },
          vertical = {
            mirror = true,
            prompt_position = "top",
          },
        },
        file_ignore_patterns = { "node_modules/", ".git/" },
        prompt_prefix = " > ",
      },
      pickers = {
        -- colorscheme = commonDropdown,
        oldfiles = filePicker,
        find_files = filePicker,
        current_buffer_fuzzy_find = {
          theme = "dropdown",
        },
        -- buffers = commonDropdown,
        -- builtin = commonDropdown,
      },
      extensions = {
        advanced_git_search = {
          diff_plugin = "fugitive",
          git_flags = {},
          git_diff_flags = {},
        },
      },
    })

    telescope.load_extension("advanced_git_search")
    telescope.load_extension("dir")
  end,
  keys = {
    {
      "<leader>o",
      mode = { "n" },
      "<cmd>Telescope find_files<cr>",
      desc = "Space [O]pen",
    },
    {
      "<leader>f",
      mode = { "n" },
      "<cmd>Telescope live_grep<cr>",
      desc = "Space [F]ind",
    },
    {
      "<leader>wf",
      mode = { "n" },
      "<cmd>Telescope grep_string<cr>",
      desc = "[W]ord [F]ind",
    },
    {
      "<leader>sd",
      mode = { "n" },
      "<cmd>Telescope diagnostics<cr>",
      desc = "[S]how [D]iagnostics",
    },
    {
      "<leader><leader>",
      mode = { "n" },
      "<cmd>Telescope<cr>",
      desc = "Map space-space to see Telescope menu",
    },
    {
      "<leader>rf",
      mode = { "n" },
      "<cmd>lua require('telescope.builtin').oldfiles({cwd_only=true})<cr>",
      desc = "Space [R]ecent [F]iles",
    },
    {
      "<leader>gc",
      mode = { "n" },
      "<cmd>Telescope advanced_git_search search_log_content<cr>",
      desc = "Space [G]it [C]ommits",
    },
    {
      "<leader>gfc",
      mode = { "n" },
      "<cmd>Telescope advanced_git_search diff_commit_file<cr>",
      desc = "Space [G]it [F]ile [C]ommits",
    },
    {
      "<leader>bl",
      mode = { "n" },
      "<cmd>Telescope buffers<cr>",
      desc = "[B]uffers [L]ist",
    },
    {
      "<leader>df",
      mode = { "n" },
      "<cmd>Telescope dir live_grep<cr>",
      desc = "[D]irectory [F]ind",
    },
    {
      "<leader><s-f>",
      mode = { "n" },
      "<cmd>Telescope current_buffer_fuzzy_find<cr>",
    },
    {
      "<leader><s-h>",
      mode = { "n" },
      "<cmd>Telescope help_tags<cr>",
    },
  },
}
