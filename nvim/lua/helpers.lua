local M = {}

--- Concats two tables and returns new table
---@param t1 table
---@param t2 table
---@return table
function M.concatTables(t1, t2)
  local T = {}

  for k, v in pairs(t1) do
    T[k] = v
  end

  for k, v in pairs(t2) do
    T[k] = v
  end

  return T
end

function M.hasWordsBefore()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

--- Checks whether given value exists in given table
---@param tab table
---@param val any
---@return boolean
function M.hasValue(tab, val)
  for _, value in ipairs(tab) do
    if value == val then
      return true
    end
  end

  return false
end

--- @alias backgroundType
--- | "light"
--- | "dark"
--- Changes background colors
--- If background is set to light theme, changes cursor color
---@param type backgroundType
function M.setBackground(type)
  -- if type == "dark" then
  --   -- vim.cmd("colorscheme catppuccin")
  --   vim.api.nvim_set_option("background", "dark")
  --   vim.o.cursorcolumn = false
  -- else
  --   -- vim.cmd("colorscheme tokyonight-day")
  --   vim.api.nvim_set_option("background", "light")

  --   -- Set cursor color
  --   -- vim.o.cursorcolumn = true
  --   vim.cmd("hi Cursor guibg=grey guifg=black")
  --   vim.cmd("hi Cursor2 guibg=black guifg=black")
  --   vim.cmd("hi NeoTreeCursorLine guibg=#bdc0cc")
  --   vim.cmd("set guicursor=n-v-c-i:block-Cursor,i-ci-ve:ver25-Cursor2,r-cr:hor20,o:hor50")
  -- end
end

function M.map(mode, mapping, functionality, opts)
  vim.keymap.set(mode, mapping, functionality, opts)
end

return M
