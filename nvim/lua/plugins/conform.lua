return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      javascript = { "prettier" },
      typescript = { "prettier" },
      vue = { "prettier" },
      typescriptreact = { "prettier" },
      astro = { "prettier" },
      javascriptreact = { "prettier" },
      html = { "prettier" },
      htmldjango = { "prettier" },
      rust = { "rustfmt" },
    },
    formatters = {
      prettier = {
        args = function(self, ctx)
          if vim.endswith(ctx.filename, ".astro") then
            return { "--stdin-filepath", "$FILENAME", "--parser", "mdx" }
          end
          return { "--stdin-filepath", "$FILENAME" }
        end,
      },
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
