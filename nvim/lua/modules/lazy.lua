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
  { import = "plugins.tokyonight" },
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
  { import = "plugins.devicons" },
  { import = 'plugins.diffview' },
  { "dmmulroy/ts-error-translator.nvim", config = true },
  {
    "dnlhc/glance.nvim",
    config = function()
      require("glance").setup({
        border = {
          enable = true,
          top_char = "―",
          bottom_char = "―",
        },
        folds = {
          fold_closed = "",
          fold_open = "",
          folded = true, -- Automatically fold list on startup
        },
        hooks = {
          before_open = function(results, open, jump, method)
            local uri = vim.uri_from_bufnr(0)
            if #results == 1 then
              local target_uri = results[1].uri or results[1].targetUri
              if target_uri == uri then
                jump(results[1])
              else
                open(results)
              end
            else
              open(results)
            end
          end,
        },
      })
    end,
    event = "VeryLazy",
    keys = function()
      vim.keymap.set("n", "gd", "<CMD>Glance definitions<CR>", { desc = "[G]oto [D]efinition" })
      vim.keymap.set("n", "gr", "<CMD>Glance references<CR>")
      vim.keymap.set("n", "<leader>gtd", "<CMD>Glance type_definitions<CR>")
      vim.keymap.set("n", "gi", "<CMD>Glance implementations<CR>")
    end,
  },
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
    "Exafunction/codeium.nvim",
    event = "BufEnter",
    config = function()
      require("codeium").setup({})
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
    "stevearc/dressing.nvim",
    opts = {},
  },
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

vim.cmd("colorscheme catppuccin")
-- vim.cmd("colorscheme tokyonight")

-- POSSIBLE PLUGINS (check out later)
-- https://github.com/sindrets/diffview.nvim
-- https://github.com/nvim-pack/nvim-spectre
