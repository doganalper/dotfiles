return {
  "mfussenegger/nvim-dap",
  cmd = "Debug",
  enabled = false,
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
      "<leader>dtb",
      mode = { "n" },
      "<cmd>DapToggleBreakpoint<cr>",
      desc = "Space [D]ap [T]oggle [B]reakpoint",
    },
  },
}
