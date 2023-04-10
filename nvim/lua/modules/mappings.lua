require("helpers")

vim.g.mapleader = " "

local function GitBlame()
	if vim.bo.filetype == "fugitiveblame" then
		vim.cmd("x")
	else
		vim.cmd("Git blame")
	end
end

Bind("i", "jj", "<ESC>", { desc = "Map jj to <Esc>" })
Bind("n", "<leader>o", "<cmd>Telescope find_files<cr>", { desc = "Space [O]pen" })
Bind("n", "<leader>f", "<cmd>Telescope live_grep<cr>", { desc = "Space [F]ind" })
Bind("n", "<leader>wf", "<cmd>Telescope grep_string<cr>", { desc = "[W]ord [F]ind" })
Bind("n", "<leader><leader>", "<cmd>Telescope<cr>", { desc = "Map space-space to see Telescope menu" })
Bind("n", "<leader>1", "<cmd>NvimTreeToggle<cr>", { desc = "Map space-1 to toggle folder tree" })
Bind("n", "<leader>rf", function()
	require("telescope.builtin").oldfiles({
		cwd_only = true,
	})
end, { desc = "Space [R]ecent [F]iles" })
Bind("n", "<leader>tsp", "<cmd>TSPlaygroundToggle<cr>", { desc = "[T]ree[s]itter [P]layground" })

-- background theme
Bind("n", "<leader>sbd", "<cmd>set background=dark<cr>", { desc = "[S]et [B]ackground [D]ark" })
Bind("n", "<leader>sbl", "<cmd>set background=light<cr>", { desc = "[S]et [B]ackground [L]ight" })

-- Git Mappings
Bind("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Space [G]it [S]tatus" })
Bind("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Space [G]it [C]ommits" })
Bind("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>", { desc = "Space [G]it [F]ile [C]ommits" })
Bind("n", "<leader>gb", GitBlame, { desc = "[G]it [B]lame" })

-- Buffers
Bind("n", "<leaderlg", "<cmd>Telescope buffers<cr>", { desc = "Space [L]ist [B]uffers" })
Bind("n", "<leader>cb", "<cmd>bd<cr>", { desc = "Space [C]lose [B]uffer" })
Bind("n", "gt", function()
	vim.cmd(vim.v.count .. "bnext")
end, { desc = "Space [B]uffer Next" })
Bind("n", "gT", function()
	vim.cmd(vim.v.count .. "bprev")
end, { desc = "Space [B]uffer Prev" })

-- Vim Related Mappings
Bind("n", "<leader>LR", function()
	vim.cmd("LspRestart")
	print("Lsp Restarted")
end, { desc = "Space [L]sp [R]estart", silent = false })

-- Buffer Select
Bind("n", "<leader>bl", "<cmd>Telescope buffers<cr>", { desc = "[B]uffers [L]ist" })
