return {
  "mfussenegger/nvim-dap",
  cmd = "Debug",
  dependencies = {
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")

    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
  keys = {
    {
      "<leader>dgb",
      mode = { "n" },
      "<cmd>DapToggleBreakpoint<cr>",
      desc = "Space [D]ebu[G] [B]reakpoint",
    },
    {
      "<leader>dgn",
      mode = { "n" },
      "<cmd>DapNew<cr>",
      desc = "Space [D]ebu[G] [N]ew",
    },
    {
      "<leader>dgc",
      mode = { "n" },
      "<cmd>DapContinue<cr>",
      desc = "Space [D]ebu[G] [C]ontinue",
    },
    {
      "<leader>dgt",
      mode = { "n" },
      "<cmd>lua require('dapui').toggle()<cr>",
      desc = "Space [D]ebu[G] [T]oggle UI",
    },
    {
      "<leader>dgi",
      mode = { "n" },
      "<cmd>lua require('dapui').eval()<cr>",
      desc = "Space [D]ebu[G] [I]nformation",
    },
  },
}
