return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v2.x",
  dependencies = {
    -- LSP Support
    -- { "neovim/nvim-lspconfig" }, -- Required
    { "mason-org/mason.nvim", version = "^1.0.0" },  -- explicit v1 lock
    { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" }, -- same here
    { "williamboman/mason.nvim" }, -- Optional
    { "williamboman/mason-lspconfig.nvim" }, -- Optional

    -- Autocompletion
    { "hrsh7th/nvim-cmp" }, -- Required
    { "hrsh7th/cmp-nvim-lsp", event = "VeryLazy" }, -- Required

    -- Snippets
    { "L3MON4D3/LuaSnip", event = "VeryLazy" }, -- Required
    { "rafamadriz/friendly-snippets", event = "VeryLazy" }, -- Optional
    { "saadparwaiz1/cmp_luasnip", event = "VeryLazy" }, -- Optional
  },
  config = function()
    local helpers = require("helpers")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lsp_zero = require("lsp-zero")
    local lsp_config = require("lspconfig")
    require("lspconfig.ui.windows").default_options.border = "single"

    mason.setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "ts_ls",
        "gopls",
        -- "volar",
        "vuels",
        "cssls",
        "tailwindcss",
        "html",
        "astro",
        "marksman",
      },
      handlers = {
        -- NOTE: this is temporary, ts_ls will be released later but before that it gives error about tsserver will be deprecated
        -- function(server_name)
        --   if server_name == "tsserver" then
        --     server_name = "ts_ls"
        --   end
        -- end,
      },
      automatic_installation = true,
    })

    lsp_zero.on_attach(function(_, bufnr)
      lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    local root_pattern = lsp_config.util.root_pattern

    lsp_zero.preset("recommended")

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    lsp_zero.set_preferences({
      set_lsp_keymaps = { omit = { "K", "<F4>", "<F2>", "gr", "gi", "gd" } },
      sign_icons = {
        error = "E",
        warn = "W",
        hint = "H",
        info = "I",
      },
    })

    -- see: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/lsp.md#disable-semantic-highlights
    lsp_zero.set_server_config({
      on_init = function(client)
        client.server_capabilities.semanticTokensProvider = nil
      end,
    })

    lsp_zero.on_attach(function(_, bufnr)
      -- lsp actions
      helpers.map("n", "<leader>i", vim.lsp.buf.hover, { buffer = bufnr, desc = "Space [I]nfo" })
      helpers.map("n", "<leader>rn", function()
        vim.lsp.buf.rename()
      end, { buffer = bufnr, desc = "Space [R]e[n]ame" })
      helpers.map("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Space [C]ode [A]ction" })
      -- helpers.map("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "[G]oto [D]efinition" })
      -- helpers.map("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "[G]oto [R]eferences" })
      -- helpers.map(
      --   "n",
      --   "<leader>gtd",
      --   vim.lsp.buf.type_definition,
      --   { buffer = bufnr, desc = "[G]oto [T]ype [D]efinition" }
      -- )
      -- helpers.map("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "[G]oto [I]mplementation" })
    end)

    lsp_config.eslint.setup({
      capabilities = capabilities,
    })

    lsp_config.ts_ls.setup({
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            -- location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
            location = "/home/adogan/.nvm/versions/node/v20.18.0/lib/node_modules/@vue/typescript-plugin",
            languages = { "javascript", "typescript", "vue" },
          },
        },
      },
      settings = {
        completions = {
          completeFunctionCalls = true,
        },
      },
      filetypes = {
        "vue",
        "javascript",
        "typescript",
        "typescriptreact",
        "javascriptreact",
      },
      capabilities = capabilities,
    })

    -- -- attach vetur when there's a vetur file
    lsp_config.vuels.setup({
      root_dir = root_pattern("vetur*"),
      capabilities = capabilities,
    })

    -- -- attach volar when there's a vite file
    lsp_config.volar.setup({
      root_dir = root_pattern("vite*"),
      capabilities = capabilities,
    })

    lsp_config.marksman.setup({
      capabilities = capabilities,
    })

    lsp_config.lua_ls.setup({
      settings = {
        Lua = {
          hint = {
            enable = true,
          },
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
      capabilities = capabilities,
    })

    local htmlFileTypes = {
      "html",
      "vue",
      "astro",
      "typescriptreact",
      "javascriptreact",
      "htmldjango",
      "php",
    }
    lsp_config.html.setup({
      filetypes = htmlFileTypes,
      capabilities = capabilities,
    })
    lsp_config.emmet_ls.setup({
      filetypes = htmlFileTypes,
      capabilities = capabilities,
    })

    lsp_config.gopls.setup({
      filetypes = { "go" },
      capabilities = capabilities,
    })

    lsp_zero.skip_server_setup({ "rust_analyzer" })

    lsp_zero.setup()

    vim.diagnostic.config({
      virtual_text = true,
    })
  end,
  keys = {
    {
      "<leader>LR",
      mode = { "n" },
      function()
        vim.cmd("LspRestart")
        print("Lsp Restarted")
      end,
      desc = "[L]sp [R]estart",
      silent = false,
    },
  },
}
