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
  { import = "plugins.catppuccin" },
  { import = "plugins.treesitter-context" },
  { import = "plugins.friendly-snippets" },
  { import = "plugins.fugitive" },
  { import = "plugins.conform" },
  { import = "plugins.harpoon" },
  { import = "plugins.crates" },
  { import = "plugins.rust-tools" },
  { import = "plugins.templates" },
  { import = "plugins.neogen" },
  { import = "plugins.big-file" },
  { "dmmulroy/ts-error-translator.nvim", config = true },
  {
    "rest-nvim/rest.nvim",
    enabled = false,
    dependencies = {
      {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
      },
    },
    ft = "http",
    config = function()
      require("rest-nvim").setup()
    end,
  },
  {
    -- https://github.com/Exafunction/codeium.vim?tab=readme-ov-file#-installation-options
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
      -- TODO: change this mapping
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
    end,
  },
  {
    "declancm/maximize.nvim",
    config = true,
    keys = {
      {
        "<leader>m",
        mode = { "n" },
        "<Cmd>lua require('maximize').toggle()<CR>",
        desc = "[M]aximize/[M]inimize Split",
      },
    },
  },
  { "folke/neodev.nvim", opts = {}, ft = "lua" },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        search = {
          enabled = false,
        },
      },
    },
    keys = {
      {
        "s",
        mode = { "n" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
    },
  },
  "princejoogie/dir-telescope.nvim",
  "nvim-lua/plenary.nvim",

  -- Treesitter stuff
  "windwp/nvim-ts-autotag",
  "JoosepAlviste/nvim-ts-context-commentstring",

  -- Rust debugging
  { import = "plugins.dap" },
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
    path = "~/Desktop/projects/nvim-plugins",
  },
}

require("lazy").setup(plugins, opts)

-- vim.g.gruvbox_material_background = "medium"
-- vim.cmd('colorscheme gruvbox-material')
vim.cmd("colorscheme catppuccin")

-- POSSIBLE PLUGINS (check out later)
-- https://github.com/sindrets/diffview.nvim
