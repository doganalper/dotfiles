return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      javascript = { { "prettier", "biome" } },
      typescript = { { "prettier", "biome" } },
      vue = { "prettier" },
      typescriptreact = { { "prettier", "biome" } },
      astro = { "prettier" },
      javascriptreact = { { "prettier", "biome" } },
      html = { "prettier" },
      htmldjango = { "prettier" },
      rust = { "rustfmt" },
    },
  },
  event = "VeryLazy",
  keys = {
    {
      "gq",
      mode = { "n" },
      "<cmd>lua require('conform').format()<cr>",
      desc = "Format File",
    },
  },
}
