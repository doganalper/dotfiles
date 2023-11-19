return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    -- "nvim-treesitter/playground",
  },
  build = ":TSUpdate",
  config = function()
    local commonDisables = { "help" }
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "astro",
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
      },
      highlight = {
        enable = true,
        disable = commonDisables,
      },
      indent = {
        enable = true,
      },
      -- context_commentstring = {
      -- 	enable = true,
      -- 	disable = commonDisables,
      -- },
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
