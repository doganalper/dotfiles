return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  dependencies = {
    { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
    { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
  },
  opts = {
    debug = true, -- Enable debugging
    window = {
      width = 0.35,
      border = "rounded",
    },
  },
  keys = {
    {
      "<leader>cct",
      mode = { "n" },
      "<cmd>CopilotChatToggle<cr>",
      desc = "[C]opilot [C]hat [T]oggle",
    },
  },
}
