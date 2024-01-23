local plugins = {
  { import = "plugins.advanced-git-search" },
  { import = "plugins.cmp" },
  { import = "plugins.devicons" },
  { import = "plugins.gitsigns" },
  { import = "plugins.lsp-zero" },
  { import = "plugins.lsp-kind" },
  { import = "plugins.lua-snip" },
  { import = "plugins.lualine" },
  { import = "plugins.nvim-comment" },
  { import = "plugins.neotree" },
  { import = "plugins.telescope" },
  { import = "plugins.todo-comments" },
  { import = "plugins.treesitter" },
  -- { import = "plugins.vim-go" },
  { import = "plugins.wilder" },
  -- { import = "plugins.glance" },
  { import = "plugins.auto-pairs" },
  { import = "plugins.catppuccin" },
  { import = "plugins.treesitter-context" },
  { import = "plugins.friendly-snippets" },
  { import = "plugins.fugitive" },
  { import = "plugins.conform" },
  { import = "plugins.harpoon" },
  { import = "plugins.crates" },
  { import = "plugins.rust-tools" },
  { import = "plugins.templates" },
  { import = "plugins.alpha" },
  "princejoogie/dir-telescope.nvim",
  "nvim-lua/plenary.nvim",

  -- Treesitter stuff
  "windwp/nvim-ts-autotag",
  "JoosepAlviste/nvim-ts-context-commentstring",

  -- Rust debugging
  { import = "plugins.dap" },

  -- JS/TS debugging
  { import = "plugins.js-debug" },
}

local opts = {
  change_detection = {
    enabled = true,
    notify = false,
  },
  ui = {
    border = "rounded",
    title = "Plugins",
    title_pos = "left",
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
  dev = {
    -- path = "~/Desktop/projects/nvim-plugins",
  },
}

require("lazy").setup(plugins, opts)

-- POSSIBLE PLUGINS (check out later)
-- https://github.com/sindrets/diffview.nvim
-- https://github.com/sainnhe/gruvbox-material
--  https://github.com/kkoomen/vim-doge (generate code docs)
