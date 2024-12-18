return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local commonDisables = { "help" }
    require("nvim-treesitter.configs").setup({
      -- incremental_selection = {
      --   enable = true,
      --   keymaps = {
      --     init_selection = "<tab>",
      --     node_incremental = "<tab>",
      --     scope_incremental = "<bs>",
      --     node_decremental = "<s-tab>",
      --   },
      -- },
      ensure_installed = {
        -- "astro",
        "vim",
        "javascript",
        "typescript",
        "lua",
        "vimdoc",
        "vue",
        "tsx",
        "jsdoc",
        "html",
        "css",
        "rust",
        "bash",
        "http",
        "json"
      },
      highlight = {
        enable = true,
        disable = commonDisables,
      },
      indent = {
        enable = true,
      },
      autotag = {
        enable = true,
        enable_close_on_slash = false,
      },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = "o",
          toggle_hl_groups = "i",
          toggle_injected_languages = "t",
          toggle_anonymous_nodes = "a",
          toggle_language_display = "I",
          focus_language = "f",
          unfocus_language = "F",
          update = "R",
          goto_node = "<cr>",
          show_help = "?",
        },
      },
    })
  end,
}
