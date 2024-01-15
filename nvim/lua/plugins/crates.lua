return {
  "saecki/crates.nvim",
  tag = "stable",
  dependencies = { "nvim-lua/plenary.nvim" },
  ft = "toml",
  config = function()
    require("crates").setup({
      -- autoload = true,
      -- smart_insert = true,
    })
  end,
}
