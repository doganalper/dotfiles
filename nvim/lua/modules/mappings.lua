local helpers = require("helpers")

helpers.map("i", "jj", "<ESC>", { desc = "helpers.Map jj to <Esc>" })

-- Buffers
helpers.map("n", "gt", function()
  vim.cmd(vim.v.count .. "bnext")
end, { desc = "Space [B]uffer Next" })
helpers.map("n", "gT", function()
  vim.cmd(vim.v.count .. "bprev")
end, { desc = "Space [B]uffer Prev" })

-- Set size of window
helpers.map("n", "<C-k>", "<cmd>resize +4<cr>", { desc = "Increase window height", noremap = true })
helpers.map("n", "<C-j>", "<cmd>resize -4<cr>", { desc = "Decrease window height", noremap = true })
helpers.map("n", "<C-h>", "<cmd>vertical resize -4<cr>", { desc = "Decrease window width", noremap = true })
helpers.map("n", "<C-l>", "<cmd>vertical resize +4<cr>", { desc = "Increase window width", noremap = true })

-- Clear search with <esc>
helpers.map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Split Size Changes
helpers.map("n", "<leader>weq", "<C-w>=", { desc = "[W]indow [EQ]uall" })

-- Improved Motion
helpers.map({ "n", "v" }, "H", "_", { desc = "Go to start of line" })
helpers.map({ "n", "v" }, "L", "$", { desc = "Go to end of line" })

helpers.map("n", "<leader>sbd", function()
  helpers.setBackground("dark")
end, { desc = "[S]et [B]ackground [D]ark" })
helpers.map("n", "<leader>sbl", function()
  helpers.setBackground("light")
end, { desc = "[S]et [B]ackground [L]ight" })

helpers.map({ "i", "n" }, "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "[S]ignature" })

-- Quickfix helpers.Mappings
helpers.map("n", "<CR>", function()
  if vim.bo.filetype ~= "qf" then
    vim.cmd.normal("ciw")
    vim.cmd.normal("l")
    vim.cmd("startinsert")
  else
    vim.cmd(".cc")
  end
end, {})
helpers.map("n", "X", function()
  if vim.bo.filetype == "qf" then
    vim.cmd("ccl")
  end
  if vim.bo.filetype == "fugitive" then
    vim.cmd("bd")
  end
end, { desc = "Close quick fix and fugitive with [X] key." })

-- Auto close brackets, parenthesis, quotes
helpers.map("i", '"', '""<left>')
helpers.map("i", "'", "''<left>")
helpers.map("i", "(", "()<left>")
helpers.map("i", "{", "{}<left>")
helpers.map("i", "[", "[]<left>")
helpers.map("i", "/*", "/**/<left><left>")
