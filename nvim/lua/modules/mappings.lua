require("helpers")

vim.keymap.set("i", "jj", "<ESC>", { desc = "Map jj to <Esc>" })
vim.keymap.set("n", "<leader>tsp", "<cmd>TSPlaygroundToggle<cr>", { desc = "[T]ree[s]itter [P]layground" })

-- Buffers
vim.keymap.set("n", "gt", function()
	vim.cmd(vim.v.count .. "bnext")
end, { desc = "Space [B]uffer Next" })
vim.keymap.set("n", "gT", function()
	vim.cmd(vim.v.count .. "bprev")
end, { desc = "Space [B]uffer Prev" })

-- Set size of window
vim.keymap.set("n", "<C-k>", "<cmd>resize +4<cr>", { desc = "Increase window height", noremap = true })
vim.keymap.set("n", "<C-j>", "<cmd>resize -4<cr>", { desc = "Decrease window height", noremap = true })
vim.keymap.set("n", "<C-h>", "<cmd>vertical resize -4<cr>", { desc = "Decrease window width", noremap = true })
vim.keymap.set("n", "<C-l>", "<cmd>vertical resize +4<cr>", { desc = "Increase window width", noremap = true })

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Split Size Changes
vim.keymap.set("n", "<leader>whe", "<C-w>|", { desc = "[W]indow [H]orizontally [E]xpand", silent = true })
vim.keymap.set("n", "<leader>wve", "<C-w>_", { desc = "[W]indow [V]ertically [E]xpand", silent = true })
vim.keymap.set("n", "<leader>weq", "<C-w>=", { desc = "[W]indow [EQ]uall" })

vim.keymap.set("n", "<leader>sbd", function()
	vim.api.nvim_set_option("background", "dark")
end, { desc = "[S]et [B]ackground [D]ark" })
vim.keymap.set("n", "<leader>sbl", function()
	vim.api.nvim_set_option("background", "light")
end, { desc = "[S]et [B]ackground [L]ight" })

vim.keymap.set({ 'i', 'n' }, '<c-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { desc = "[S]ignature" })
vim.keymap.set('n', '<CR>', 'ciw', {})
