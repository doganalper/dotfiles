local plugins = {
  { import = "plugins.advanced-git-search" },
  { import = "plugins.cmp" },
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
  { import = "plugins.vim-go" },
  { import = "plugins.wilder" },
  { import = "plugins.glance" },
  { import = "plugins.auto-pairs" },
  { import = "plugins.catppuccin" },
  { import = "plugins.treesitter-context" },
  { import = "plugins.flash" },
  { import = "plugins.friendly-snippets" },
  { import = "plugins.fugitive" },
  { import = "plugins.conform" },
  { import = "plugins.harpoon" },
  { import = "plugins.crates" },
  { import = "plugins.rust-tools" },
  {
    "doganalper/template.nvim",
    config = true,
  },
  "princejoogie/dir-telescope.nvim",
  "nvim-lua/plenary.nvim",
  "JoosepAlviste/nvim-ts-context-commentstring",
  "windwp/nvim-ts-autotag",
}

local opts = {
  change_detection = {
    enabled = true,
    notify = false,
  },
}

require("lazy").setup(plugins, opts)

-- POSSIBLE PLUGINS (check out later)
-- https://github.com/sindrets/diffview.nvim
-- https://github.com/sainnhe/gruvbox-material
