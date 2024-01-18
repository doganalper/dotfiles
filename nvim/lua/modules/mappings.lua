require("helpers")

Map("i", "jj", "<ESC>", { desc = "Map jj to <Esc>" })

-- Buffers
Map("n", "gt", function()
  vim.cmd(vim.v.count .. "bnext")
end, { desc = "Space [B]uffer Next" })
Map("n", "gT", function()
  vim.cmd(vim.v.count .. "bprev")
end, { desc = "Space [B]uffer Prev" })

-- Set size of window
Map("n", "<C-k>", "<cmd>resize +4<cr>", { desc = "Increase window height", noremap = true })
Map("n", "<C-j>", "<cmd>resize -4<cr>", { desc = "Decrease window height", noremap = true })
Map("n", "<C-h>", "<cmd>vertical resize -4<cr>", { desc = "Decrease window width", noremap = true })
Map("n", "<C-l>", "<cmd>vertical resize +4<cr>", { desc = "Increase window width", noremap = true })

-- Clear search with <esc>
Map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Split Size Changes
Map("n", "<leader>weq", "<C-w>=", { desc = "[W]indow [EQ]uall" })

-- Improved Motion
Map({ "n", "v" }, "H", "_", { desc = "Go to start of line" })
Map({ "n", "v" }, "L", "$", { desc = "Go to end of line" })

Map("n", "<leader>sbd", function()
  SetBackground("dark")
end, { desc = "[S]et [B]ackground [D]ark" })
Map("n", "<leader>sbl", function()
  SetBackground("light")
end, { desc = "[S]et [B]ackground [L]ight" })

Map({ "i", "n" }, "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "[S]ignature" })

-- Quickfix mappings
Map("n", "<CR>", function()
  if vim.bo.filetype ~= "qf" then
    vim.cmd.normal("ciw")
    vim.cmd.normal("l")
    vim.cmd("startinsert")
  else
    vim.cmd(".cc")
  end
end, {})
Map("n", "X", function()
  if vim.bo.filetype == "qf" then
    vim.cmd("ccl")
  end
  if vim.bo.filetype == "fugitive" then
    vim.cmd("bd")
  end
end, { desc = "Close quick fix and fugitive with [X] key." })
