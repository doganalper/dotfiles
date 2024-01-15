return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      javascript = { { "prettier", "biome-bak" } },
      typescript = { { "prettier", "biome-bak" } },
      vue = { "prettier" },
      typescriptreact = { { "prettier", "biome-bak" } },
      astro = { "prettier" },
      javascriptreact = { { "prettier", "biome-bak" } },
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
