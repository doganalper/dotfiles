-- -- refer to: https://miguelcrespo.co/posts/debugging-javascript-applications-with-neovim/

local lazy_dir = vim.fn.stdpath("data") .. "/lazy"

-- return {
--   "mxsdev/nvim-dap-vscode-js",
--   -- enabled = true,
--   config = function()
--     local utils = require("dap-vscode-js.utils")
--     local dap = require("dap")

--     local js_based_languages = { "typescript", "javascript" }

--     -- dap.adapters["pwa-node"] = {
--     --   type = "server",
--     --   host = "localhost",
--     --   port = "${port}",
--     --   executable = {
--     --     command = "node",
--     --     args = { "~/Desktop/js-debug-dap-v1.94.0/js-debug/src/dapDebugServer.js", "${port}" },
--     --   },
--     -- }

--     -- dap.configurations.typescript = {
--     --   {
--     --     type = "pwa-node",
--     --     request = "launch",
--     --     name = "Launch file",
--     --     program = "${file}",
--     --     cwd = "${workspaceFolder}",
--     --   },
--     -- }

--     require("dap-vscode-js").setup({
--       adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
--       debugger_path = string.format("%s/vscode-js-debug/", lazy_dir),
--     })

--     require("dap.ext.vscode").load_launchjs(
--       nil,
--       {
--         ["pwa-node"] = js_based_languages,
--         ["node"] = js_based_languages,
--         ["chrome"] = js_based_languages,
--         ["pwa-chrome"] = js_based_languages,
--       }
--     )

--     for _, language in ipairs(js_based_languages) do
--       dap.configurations[language] = {
--         {
--           type = "pwa-node",
--           request = "launch",
--           name = "Launch file",
--           program = "${file}",
--           cwd = "${workspaceFolder}",
--         },
--         {
--           type = "pwa-node",
--           request = "attach",
--           name = "Attach",
--           processId = require("dap.utils").pick_process,
--           cwd = "${workspaceFolder}",
--         },
--         {
--           type = "pwa-chrome",
--           request = "launch",
--           name = 'Start Chrome with "localhost"',
--           url = "http://localhost:3000",
--           webRoot = "${workspaceFolder}",
--           userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
--         },
--       }
--     end
--   end,
--   dependencies = {
--     "mfussenegger/nvim-dap",
--     "rcarriga/nvim-dap-ui",
--     {
--       "microsoft/vscode-js-debug",
--       build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
--     },
--     {
--       "Joakker/lua-json5",
--       build = "./install.sh",
--     },
--   },
--   cmd = "JsDebug",
-- }

return {
  "mxsdev/nvim-dap-vscode-js",
  config = function()
    require("dap-vscode-js").setup({
      -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
      debugger_path = string.format("%s/vscode-js-debug", lazy_dir),
      -- debugger_cmd = { "npm run start:debug" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
      adapters = {
        "chrome",
        "pwa-node",
        "pwa-chrome",
        "pwa-msedge",
        "node-terminal",
        "pwa-extensionHost",
        "node",
        "chrome",
      }, -- which adapters to register in nvim-dap
      -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
      -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
      -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
    })

    local js_based_languages = { "typescript", "javascript", "typescriptreact" }
    for _, language in ipairs(js_based_languages) do
      require("dap").configurations[language] = {
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Auto Attach",
          cwd = vim.fn.getcwd(),
          -- runtimeExecutable= "npm",
          -- runtimeArgs= {"run", "start:debug"},
          -- sourceMaps= true
        },
        {
          type = "pwa-chrome",
          request = "launch",
          name = 'Start Chrome with "localhost"',
          url = "http://localhost:3000",
          webRoot = "${workspaceFolder}",
          userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
          -- runtimeExecutable= "npm",
          -- runtimeArgs= {"run", "dev"},
          -- sourceMaps= true
        },
      }

      vim.fn.sign_define("DapBreakpoint", {
        text = "🔺", -- nerdfonts icon here
        texthl = "DapBreakpointSymbol",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
      })
      vim.fn.sign_define("DapStopped", {
        text = "❌", -- nerdfonts icon here
        texthl = "DapUiThread",
        linehl = "DapUiThread",
        numhl = "DapUiStepOut",
      })
    end
  end,
  dependencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    {
      "microsoft/vscode-js-debug",
      build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
    },
  },
}
