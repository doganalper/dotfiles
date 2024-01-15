return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
      dashboard.button(
        "<leader>rf",
        "࿚  Recent files",
        "<cmd>lua require('telescope.builtin').oldfiles({cwd_only=true})<cr>"
      ),
      dashboard.button("<leader>o", "Open File", "<cmd>Telescope find_files<cr>"),
      dashboard.button("<leader>f", "Search Word", "<cmd>Telescope live_grep<cr>"),
      dashboard.button("<leader>df", "Search Word in Directory", "<cmd>Telescope dir live_grep<cr>"),
    }

    local function footer()
      return "Web dev is exhausting tbh"
    end

    dashboard.section.footer.val = footer()

    dashboard.config.opts.noautocmd = true
    dashboard.config.opts.keymap = nil
    alpha.setup(dashboard.opts)
  end,
}
