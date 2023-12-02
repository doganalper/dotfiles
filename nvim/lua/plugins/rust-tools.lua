return {
  "simrat39/rust-tools.nvim",
  ft = "rust",
  config = function()
    local rust_tools = require("rust-tools")
    -- TODO: add dap for debugging, see: https://www.youtube.com/watch?v=gihHLsClHF0
    rust_tools.setup({
      server = {
        on_attach = function(_, bufnr)
          -- vim.keymap.set("n", "<leader>rca", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
        end,
      },
      -- dap = {
      --   adapter = {
      --     type = "executable",
      --     command = "lldb-vscode",
      --     name = "rt_lldb",
      --   },
      -- },
    })
  end,
}
