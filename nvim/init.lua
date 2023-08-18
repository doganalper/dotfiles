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
vim.o.t_Co = 256
vim.o.mouse = "a"
vim.opt.pumheight = 10
vim.o.signcolumn = "yes"
vim.o.autoread = true
vim.o.encoding = "utf-8"
vim.o.updatetime = 100
vim.o.cursorline = true
vim.opt.splitright = true -- Split windows right to the current windows
vim.opt.splitbelow = true -- Split windows below to the current windows

-- fold
vim.opt.foldlevel = 99
vim.opt.foldmethod = "indent"
vim.opt.foldenable = true


vim.opt.pumheight = 0 -- this sets height of the popup menu

local general_sets = {
	"syntax on",
}

local function setGeneralCommands()
	for _, command in pairs(general_sets) do
		vim.cmd(command)
	end
end
setGeneralCommands()

-- hover width
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.max_width = opts.max_width or 80
	opts.focusable = false
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
vim.api.nvim_command('autocmd VimResized * wincmd =')

require('helpers')
require("modules.lazy")
require("modules.mappings")
require("modules.commands")
