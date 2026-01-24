return {
  "simrat39/rust-tools.nvim",
  enabled = false,
  ft = "rust",
  config = function()
    HOME_PATH = os.getenv("HOME") .. "/"
    MASON_PATH = HOME_PATH .. ".local/share/nvim/mason/packages/"
    local codelldb_path = MASON_PATH .. "codelldb/extension/adapter/codelldb"
    local liblldb_path = MASON_PATH .. "codelldb/extension/lldb/lib/liblldb.dylib"
    local rust_tools = require("rust-tools")
    -- TODO: add dap for debugging, see: https://www.youtube.com/watch?v=gihHLsClHF0
    rust_tools.setup({
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>rca", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
        end,
      },
      tools = {
        hover_actions = {
          auto_focus = true
        }
      },
      dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
      },
      -- dap = {
      --   adapter = {
      --     type = "executable",
      --     command = "lldb-vscode",
      --     name = "rt_lldb",
      --     showDisassembly = "never",
      --   },
      -- },
    })
  end,
}
