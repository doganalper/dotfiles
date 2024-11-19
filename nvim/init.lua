local helpers = require("helpers")

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = true
vim.o.swapfile = false
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.clipboard = "unnamedplus"
vim.o.hidden = true
vim.o.mouse = "a"
-- vim.opt.pumheight = 30 -- this sets height of the popup menu
vim.o.signcolumn = "yes"
vim.o.autoread = true
vim.o.encoding = "utf-8"
vim.o.updatetime = 100
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.scrolloff = 8 -- num. of lines to show before/after of cursor when going down/up
vim.opt.splitright = true -- Split windows right to the current windows
vim.opt.splitbelow = true -- Split windows below to the current windows
vim.opt.list = true
vim.opt.listchars = { leadmultispace = "- ", tab = "│─", trail = "─" }
vim.opt.laststatus = 3

-- fold
vim.opt.foldlevel = 99
vim.opt.foldmethod = "indent"
vim.opt.foldenable = true

-- tmux color problem
vim.o.termguicolors = true

-- codeium
vim.g.codeium_disable_bindings = 1

-- hover width
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.max_width = opts.max_width or 100
  opts.max_height = opts.max_height or 30
  opts.pad_top = 0
  opts.pad_bottom = 0
  -- opts.focusable = false
  opts.focus = false
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- set mdx file to markdown
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.mdx" },
  group = vim.api.nvim_create_augroup("Markdown Set Filetype", { clear = true }),
  callback = function()
    vim.cmd("setfiletype markdown")
  end,
})

---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()
vim.api.nvim_create_autocmd("LspProgress", {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
    if not client or type(value) ~= "table" then
      return
    end
    local p = progress[client.id]

    for i = 1, #p + 1 do
      if i == #p + 1 or p[i].token == ev.data.params.token then
        p[i] = {
          token = ev.data.params.token,
          msg = ("[%3d%%] %s%s"):format(
            value.kind == "end" and 100 or value.percentage or 100,
            value.title or "",
            value.message and (" **%s**"):format(value.message) or ""
          ),
          done = value.kind == "end",
        }
        break
      end
    end

    local msg = {} ---@type string[]
    progress[client.id] = vim.tbl_filter(function(v)
      return table.insert(msg, v.msg) or not v.done
    end, p)

    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    vim.notify(table.concat(msg, "\n"), "info", {
      id = "lsp_progress",
      title = client.name,
      opts = function(notif)
        notif.icon = #progress[client.id] == 0 and " "
          or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})

-- vim.api.nvim_create_autocmd("LspProgress", {
--   ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
--   callback = function(ev)
--     local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
--     vim.notify(vim.lsp.status(), "info", {
--       id = "lsp_progress",
--       title = "LSP Progress",
--       opts = function(notif)
--         notif.icon = ev.data.params.value.kind == "end" and " "
--           or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
--       end,
--     })
--   end,
-- })

-- autocommands
-- don't auto comment new line
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- resize split on terminal split
vim.api.nvim_command("autocmd VimResized * wincmd =")

-- inlay hints
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(args)
    -- disable lsp inlay hints in rust because rust-analyzer has own
    if vim.bo.filetype == "rust" then
      return
    end

    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.inlayHintProvider then
      helpers.map("n", "<leader>tih", function()
        if vim.lsp.inlay_hint.is_enabled() then
          print("Disabled Inlay Hints")
          vim.lsp.inlay_hint.enable(false)
        else
          print("Enabled Inlay Hints")
          vim.lsp.inlay_hint.enable(true)
        end
      end, {
        desc = "[T]oggle [I]nline [H]ints",
      })
    end
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- vim.api.nvim_set_hl(0, "WinSeparator", { bg = "None" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None", fg = "None" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "None", fg = "None" })
  end,
})

-- vim.api.nvim_create_autocmd("TermEnter", {
--   callback = function()
--     -- If the terminal window is lazygit, we do not make changes to avoid clashes
--     if string.find(vim.api.nvim_buf_get_name(0), "lazygit") then
--       return
--     end
--     vim.keymap.set("t", "<ESC>", function()
--       vim.cmd("stopinsert")
--     end, { buffer = true })
--   end,
-- })

-- highlight yank for 300ms
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yanked", { clear = true }),
  desc = "Highlight on yank",
  callback = function()
    vim.highlight.on_yank({ higroup = "ErrorMsg", timeout = 400 })
  end,
})

vim.cmd("autocmd bufwritepost ~/.config/kitty/kitty.conf :silent !kill -SIGUSR1 $(pgrep kitty) ")

require("modules.lazy")
require("modules.mappings")
require("modules.commands")
