return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v2.x",
  dependencies = {
    -- LSP Support
    { "neovim/nvim-lspconfig" }, -- Required
    { "williamboman/mason.nvim" }, -- Optional
    { "williamboman/mason-lspconfig.nvim" }, -- Optional

    -- Autocompletion
    { "hrsh7th/nvim-cmp" }, -- Required
    { "hrsh7th/cmp-nvim-lsp" }, -- Required

    -- Snippets
    { "L3MON4D3/LuaSnip" }, -- Required
    { "rafamadriz/friendly-snippets" }, -- Optional
    { "saadparwaiz1/cmp_luasnip" }, -- Optional
  },
  config = function()
    require("helpers")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lsp_zero = require("lsp-zero")

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
        "tsserver",
        "volar",
        "vuels",
        "cssls",
        "tailwindcss",
        "html",
        "astro"
        -- "prettier"
      },
      automatic_installation = true,
    })

    lsp_zero.on_attach(function(client, bufnr)
      lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    local lsp_config = require("lspconfig")
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

    lsp_zero.on_attach(function(client, bufnr)
      -- lsp actions
      Map("n", "<leader>i", vim.lsp.buf.hover, { buffer = bufnr, desc = "Space [I]nfo" })
      Map("n", "<leader>rn", function()
        vim.lsp.buf.rename()
      end, { buffer = bufnr, desc = "Space [R]e[n]ame" })
      Map("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Space [C]ode [A]ction" })
      Map("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "[G]oto [D]efinition" })
      Map("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "[G]oto [R]eferences" })
      Map(
        "n",
        "<leader>gtd",
        vim.lsp.buf.type_definition,
        { buffer = bufnr, desc = "[G]oto [T]ype [D]efinition" }
      )
      Map("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "[G]oto [I]mplementation" })
    end)

    lsp_config.eslint.setup({
      capabilities = capabilities,
    })

    lsp_config.tsserver.setup({
      init_options = {
        preferences = {
          includeInlayParameterNameHints = "all",
        },
      },
      settings = {
        completions = {
          completeFunctionCalls = true,
        },
      },
      filetypes = {
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
    }
    lsp_config.html.setup({
      filetypes = htmlFileTypes,
      capabilities = capabilities,
    })
    lsp_config.emmet_ls.setup({
      filetypes = htmlFileTypes,
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
