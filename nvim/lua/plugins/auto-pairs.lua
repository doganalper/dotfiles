return {
  "windwp/nvim-autopairs",
  config = function()
    local npairs = require("nvim-autopairs")
    local Rule = require("nvim-autopairs.rule")

    npairs.setup({})

    npairs.add_rule(Rule("|", "|", "rust"))

    npairs.add_rule(Rule("/**", " */", { "javascript", "typescript", "javascriptreact", "typescriptreact" }))
  end,
  event = "VeryLazy",
}
