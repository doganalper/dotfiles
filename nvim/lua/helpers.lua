function ConcatTables(t1, t2)
	local T = {}

	for k, v in pairs(t1) do
		T[k] = v
	end

	for k, v in pairs(t2) do
		T[k] = v
	end

	return T
end

function HasWordsBefore()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

function HasValue(tab, val)
	for index, value in ipairs(tab) do
		if value == val then
			return true
		end
	end

	return false
end

Bind = vim.keymap.set
