return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    version = "*",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local helpers = require("helpers")
      require("lspconfig.ui.windows").default_options.border = "single"

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if cmp_nvim_lsp_ok then
        capabilities = cmp_nvim_lsp.default_capabilities()
      end

      require("lspconfig")

      local eslint_capabilities = vim.deepcopy(capabilities)
      if eslint_capabilities.textDocument then
        eslint_capabilities.textDocument.diagnostic = nil
      end
      if eslint_capabilities.diagnosticProvider then
        eslint_capabilities.diagnosticProvider = nil
      end

      vim.lsp.config("eslint", {
        capabilities = eslint_capabilities,
      })

      local servers = {
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
        "emmet_ls",
      }

      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          flags = {
            debounce_text_changes = 150,
          },
          capabilities = capabilities,
          on_init = function(client)
            client.server_capabilities.semanticTokensProvider = nil
            if client.name == "eslint" then
              if client.server_capabilities.textDocument then
                client.server_capabilities.textDocument.diagnostic = nil
              end
              if client.server_capabilities.diagnosticProvider then
                client.server_capabilities.diagnosticProvider = nil
              end
            end
          end,
          on_attach = function(client, bufnr)
            local opts = { buffer = bufnr, desc = "" }

            helpers.map("n", "<leader>i", function()
              vim.lsp.buf.hover({
                border = "rounded",
              })
            end, vim.tbl_extend("force", opts, { desc = "Space [I]nfo" }))
            helpers.map("n", "<leader>rn", function()
              vim.lsp.buf.rename()
            end, vim.tbl_extend("force", opts, { desc = "Space [R]e[N]ame" }))
            helpers.map(
              "n",
              "<leader>ca",
              vim.lsp.buf.code_action,
              vim.tbl_extend("force", opts, { desc = "Space [C]ode [A]ction" })
            )
          end,
        })
      end

      vim.lsp.enable(servers)

      vim.diagnostic.config({
        virtual_text = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN] = "W",
            [vim.diagnostic.severity.INFO] = "I",
            [vim.diagnostic.severity.HINT] = "H",
          },
        },
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
  },
  {
    "mason-org/mason.nvim",
    version = "^1.0.0",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    version = "^1.0.0",
    dependencies = { "mason-org/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
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
        automatic_installation = true,
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    dependencies = { "mason-org/mason.nvim" },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason-lspconfig.nvim" },
  },
}
