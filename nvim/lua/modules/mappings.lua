require("helpers")

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
Bind("n", "<leader>sd", "<cmd>Telescope diagnostics<cr>", { desc = "[S]how [D]iagnostics" })
Bind("n", "<leader><leader>", "<cmd>Telescope<cr>", { desc = "Map space-space to see Telescope menu" })
Bind("n", "<leader>1", "<cmd>NvimTreeToggle<cr>", { desc = "Map space-1 to toggle folder tree" })
Bind("n", "<leader>rf", function()
	require("telescope.builtin").oldfiles({
		cwd_only = true,
	})
end, { desc = "Space [R]ecent [F]iles" })
Bind("n", "<leader>tsp", "<cmd>TSPlaygroundToggle<cr>", { desc = "[T]ree[s]itter [P]layground" })

-- background theme
Bind("n", "<leader>sbd", function()
	vim.cmd("colorscheme catppuccin")
end, { desc = "[S]et [B]ackground [D]ark" })
Bind("n", "<leader>sbl", function()
	vim.cmd("colorscheme tokyonight-day")
end, { desc = "[S]et [B]ackground [L]ight" })

-- Git Mappings
-- Extension for git commits see:https://github.com/aaronhallaert/advanced-git-search.nvim
Bind("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Space [G]it [S]tatus" })
Bind("n", "<leader>gc", "<cmd>Telescope advanced_git_search search_log_content<cr>", { desc = "Space [G]it [C]ommits" })
Bind(
	"n",
	"<leader>gfc",
	"<cmd>Telescope advanced_git_search diff_commit_file<cr>",
	{ desc = "Space [G]it [F]ile [C]ommits" }
)
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

-- Set size of window
Bind("n", "<C-Up>", "<cmd>resize +4<cr>", { desc = "Increase window height", noremap = true })
Bind("n", "<C-Down>", "<cmd>resize -4<cr>", { desc = "Decrease window height", noremap = true })
Bind("n", "<C-Left>", "<cmd>vertical resize -4<cr>", { desc = "Decrease window width", noremap = true })
Bind("n", "<C-Right>", "<cmd>vertical resize +4<cr>", { desc = "Increase window width", noremap = true })

-- Clear search with <esc>
Bind({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Folding
local ufo = require("ufo")
Bind("n", "zR", ufo.openAllFolds, { desc = "Open All Folds" })
Bind("n", "zM", ufo.closeAllFolds, { desc = "Close All Folds" })
Bind("n", "K", function()
	local winid = ufo.peekFoldedLinesUnderCursor()
end)

-- Split Size Changes
Bind("n", "<leader>whe", "<C-w>|", { desc = "[W]indow [H]orizontally [E]xpand", silent = true })
Bind("n", "<leader>wve", "<C-w>_", { desc = "[W]indow [V]ertically [E]xpand", silent = true })
Bind("n", "<leader>weq", "<C-w>=", { desc = "[W]indow [EQ]uall" })
