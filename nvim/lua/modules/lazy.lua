local plugins = {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
      {
        "<leader>gg",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
    },
    opts = {
      debug = { enabled = false },
      bigfile = { enabled = false },
      bufdelete = { enabled = false },
      git = { enabled = false },
      rename = { enabled = false },
      statuscolumn = { enabled = false },
      terminal = { enabled = false },
      toggle = { enabled = false },
      win = { enabled = false },
      words = { enabled = false },
      notifier = { enabled = true },
      dashboard = {
        sections = {
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
        preset = {
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "F", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua require('telescope.builtin').oldfiles({cwd_only=true})" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
      styles = {
        notification = {
          wo = { wrap = true }, -- Wrap notifications
        },
      },
      gitbrowse = {
        enabled = false,
        -- what = "file",
        -- url_patterns = {
        --   ["bitbucket.kartaca.com"] = {
        --     branch = "/-/browse?at={branch}",
        --     file = "/-/browse/{file}?at={branch}#lines-{line}",
        --   },
        -- },
      },
    },
  },
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
  { import = "plugins.gruvbox" },
  { import = "plugins.bufferline" },
  { import = "plugins.gitdiffview" },
  { import = "plugins.neotest" },
  { import = "plugins.avante" },
  { import = "plugins.github-theme" },
  { "dmmulroy/ts-error-translator.nvim", config = true },
  { "nvim-tree/nvim-web-devicons" },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      exclude_filetypes = { "mysql", "neo-tree", "dbui", "dbout" },
    },
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_disable_progress_bar = 1
      vim.g.db_ui_force_echo_notifications = 1
    end,
    keys = {
      { "<leader>db", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    enabled = false,
    branch = "canary",
    dependencies = {
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      window = {
        layout = "float",
        border = "rounded",
        width = 0.5,
        height = 0.8,
      },
      prompts = {
        Tests = {
          prompt = "/COPILOT_GENERATE Use React Testing Library and Vitest, do not explain code, just generate",
        },
        Commit = {
          prompt = "Write a commit message about current changes, commit message must start with current branch name",
        },
        CommitStaged = {
          prompt = "Write a commit message about current changes, commit message must start with current branch name",
        },
      },
      system_prompt = string.format([[
  You are an expert in TypeScript, Node.js, React, Vite, Material UI, React Hook Forms, Redux and Redux Thunk.

  Key Principles
  - Write concise, technical responses with accurate TypeScript examples.
  - Use functional, declarative programming. Avoid classes.
  - Prefer iteration and modularization over duplication.
  - Use descriptive variable names with auxiliary verbs (e.g., isLoading).
  - Use lowercase with dashes for directories (e.g., components/auth-wizard).
  - Favor named exports for components.
  - Use the Receive an Object, Return an Object (RORO) pattern.

  JavaScript/TypeScript
  - Use "function" keyword for pure functions.
  - Use TypeScript for all code.
  - For single-line statements in conditionals, use curly brackets and have them on seperate line.

  React
  - Use functional components and TypeScript interfaces.
  - Use declarative JSX.
  - Use function, not const, for components.
  - Use Material Ui for components and styling.
  - Use Zod for form validation.

  Tests
  - Use React Testing Library and Vitests

  Extra Notes
  - Don't display line numbers on diffs
      ]]),
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      panel = {
        enabled = false,
        position = "right",
        ratio = 0.25,
      },
      suggestion = {
        enabled = false,
        auto_trigger = true,
        keymap = {
          accept = "<C-g>",
          next = "]c",
          prev = "[c",
        },
      },
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    enabled = true,
    config = true,
  },
  -- {
  --   "kndndrj/nvim-dbee",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --   },
  --   build = function()
  --     -- Install tries to automatically detect the install method.
  --     -- if it fails, try calling it with one of these parameters:
  --     --    "curl", "wget", "bitsadmin", "go"
  --     require("dbee").install()
  --   end,
  --   config = function()
  --     require("dbee").setup(--[[optional config]])
  --   end,
  --   keys = {
  --     { "<leader>db", "<cmd>lua require('dbee').toggle()<cr>", desc = "Toggle dbee" },
  --   },
  -- },
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
          fold_closed = ">",
          fold_open = "v",
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
    "stevearc/dressing.nvim",
    opts = {},
  },
  {
    "Exafunction/codeium.nvim",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({})

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
  { "folke/neodev.nvim", opts = {} },
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
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
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

  -- JS/TS debugging
  { import = "plugins.js-debug" },

  { "EdenEast/nightfox.nvim" },
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

table.insert(vim._so_trails, "/?.dylib")

require("lazy").setup(plugins, opts)

vim.g.gruvbox_material_background = "hard"
-- vim.cmd("colorscheme catppuccin")
-- vim.cmd('colorscheme nightfox')
vim.cmd("colorscheme gruvbox-material")
-- vim.cmd("colorscheme github_dark")
-- vim.cmd("colorscheme tokyonight")

-- POSSIBLE PLUGINS (check out later)
-- https://github.com/sindrets/diffview.nvim
