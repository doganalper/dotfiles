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

local rocks_config = {
  rocks_path = vim.env.HOME .. "/.local/share/nvim/rocks",
}

vim.g.rocks_nvim = rocks_config

local luarocks_path = {
  vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?.lua"),
  vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?", "init.lua"),
}
package.path = package.path .. ";" .. table.concat(luarocks_path, ";")

local luarocks_cpath = {
  vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.so"),
  vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.so"),
  -- Remove the dylib and dll paths if you do not need macos or windows support
  vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.dylib"),
  vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.dylib"),
  vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.dll"),
  vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.dll"),
}
package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")

vim.opt.runtimepath:append(vim.fs.joinpath(rocks_config.rocks_path, "lib", "luarocks", "rocks-5.1", "rocks.nvim", "*"))

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
vim.o.scrolloff = 8 -- num. of lines to show before/after of cursor when going down/up
vim.opt.splitright = true -- Split windows right to the current windows
vim.opt.splitbelow = true -- Split windows below to the current windows
vim.opt.list = true
vim.opt.listchars = { leadmultispace = "- ", tab = "» " }
-- vim.o.laststatus = 3
-- vim.o.winbar = "%= %F %m %="

-- fold
vim.opt.foldlevel = 3
vim.opt.foldmethod = "indent"
vim.opt.foldenable = true

-- tmux color problem
vim.o.termguicolors = true

-- codeium
vim.g.codeium_disable_bindings = 1

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "WinSeparator", { bg = "None" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None", fg = "None" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "None", fg = "None" })
    -- vim.api.nvim_set_hl(0, "Winbar", { fg = "None" })
  end,
})

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

-- highlight yank for 300ms
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yanked", { clear = true }),
  desc = "Highlight on yank",
  callback = function()
    vim.highlight.on_yank({ higroup = "ErrorMsg", timeout = 400 })
  end,
})

require("modules.lazy")
require("modules.mappings")
require("modules.commands")
