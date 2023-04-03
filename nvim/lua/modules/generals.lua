vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.swapfile = false
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.clipboard = "unnamedplus"
vim.o.hidden = true
vim.o.t_Co = 256
vim.o.mouse = "a"
vim.o.pumheight = 10
vim.o.signcolumn = "yes"
vim.o.autoread = true
vim.o.encoding = "utf-8"
vim.o.updatetime = 100
vim.o.foldenable = true
vim.o.foldmethod = "manual"

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
