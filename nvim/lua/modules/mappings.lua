require("helpers")

Bind("i", "jj", "<ESC>", { desc = "Map jj to <Esc>" })
Bind("n", "<leader>1", "<cmd>NvimTreeToggle<cr>", { desc = "Map space-1 to toggle folder tree" })
Bind("n", "<leader>tsp", "<cmd>TSPlaygroundToggle<cr>", { desc = "[T]ree[s]itter [P]layground" })

-- background theme
Bind("n", "<leader>sbd", function()
	vim.cmd("colorscheme catppuccin")
end, { desc = "[S]et [B]ackground [D]ark" })
Bind("n", "<leader>sbl", function()
	vim.cmd("colorscheme tokyonight-day")
end, { desc = "[S]et [B]ackground [L]ight" })

-- Buffers
Bind("n", "<leader>cb", "<cmd>bd<cr>", { desc = "Space [C]lose [B]uffer" })
Bind("n", "gt", function()
	vim.cmd(vim.v.count .. "bnext")
end, { desc = "Space [B]uffer Next" })
Bind("n", "gT", function()
	vim.cmd(vim.v.count .. "bprev")
end, { desc = "Space [B]uffer Prev" })

-- Set size of window
Bind("n", "<C-Up>", "<cmd>resize +4<cr>", { desc = "Increase window height", noremap = true })
Bind("n", "<C-Down>", "<cmd>resize -4<cr>", { desc = "Decrease window height", noremap = true })
Bind("n", "<C-Left>", "<cmd>vertical resize -4<cr>", { desc = "Decrease window width", noremap = true })
Bind("n", "<C-Right>", "<cmd>vertical resize +4<cr>", { desc = "Increase window width", noremap = true })

-- Clear search with <esc>
Bind({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Split Size Changes
Bind("n", "<leader>whe", "<C-w>|", { desc = "[W]indow [H]orizontally [E]xpand", silent = true })
Bind("n", "<leader>wve", "<C-w>_", { desc = "[W]indow [V]ertically [E]xpand", silent = true })
Bind("n", "<leader>weq", "<C-w>=", { desc = "[W]indow [EQ]uall" })
