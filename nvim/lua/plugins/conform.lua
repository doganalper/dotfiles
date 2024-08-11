return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      css = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      vue = { "prettier" },
      typescriptreact = { "prettier" },
      svelte = { "prettier" },
      astro = { "prettier" },
      javascriptreact = { "prettier" },
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
