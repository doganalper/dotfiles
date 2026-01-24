-- Create feature branch
vim.api.nvim_create_user_command("GF", "Git checkout -b feature/<q-args>", { nargs = 1 })
vim.api.nvim_create_user_command("GA", "Git add .", {})
vim.api.nvim_create_user_command("GC", "Git commit -m <q-args>", { nargs = 1 })
vim.api.nvim_create_user_command("GP", "Git push", {})
vim.api.nvim_create_user_command("GPO", "Git push origin HEAD", {})

vim.api.nvim_create_user_command("DiffThis", "Gvdiffsplit!", {})

vim.api.nvim_create_user_command("GitBrowse", function()
  require("snacks.gitbrowse").open()
end, {})

-- terminal command
vim.api.nvim_create_user_command("T", "10 split | terminal", {})

vim.api.nvim_create_user_command("CBE", "%bdelete|edit#|bdelete#", {})

vim.api.nvim_create_user_command("RunRequest", "lua require('rest-nvim').run()", {})

vim.api.nvim_create_user_command("TSI", function()
  vim.cmd("norm O // @ts-ignore")
end, {})
vim.api.nvim_create_user_command("TSER", function()
  vim.cmd("norm O // @ts-expect-error [Comment]")
end, {})

-- Turn pixel to rem
vim.api.nvim_create_user_command("TPR", "echo (0.0625 * <q-args>)", { nargs = 1 })

-- Toggle transparent background
vim.api.nvim_create_user_command("TTB", function()
  local cat = require("catppuccin")
  cat.options.transparent_background = not cat.options.transparent_background
  cat.compile()
  vim.cmd.colorscheme(vim.g.colors_name)
end, {})

-- Toggle line wrap
vim.api.nvim_create_user_command("TWW", function()
  vim.o.wrap = not vim.o.wrap
end, {})

-- Close every other buffers except active one
vim.api.nvim_create_user_command("Co", function()
  vim.cmd("%bd|e#")
end, {})

-- Replace string on open buffer
vim.api.nvim_create_user_command("RP", function(val)
  vim.cmd("%s/" .. val.args:gsub(" ", "/") .. "/g")
end, { nargs = 1 })

-- Replace string on line current line
vim.api.nvim_create_user_command("RPL", function(val)
  vim.cmd("s/" .. val.args:gsub(" ", "/") .. "/g")
end, { nargs = 1 })

-- Run Jest Tests
vim.api.nvim_create_user_command("Jest", function()
  vim.cmd("lua require('neotest').run.run({ jestCommand = 'npm run test' })")
  vim.cmd("lua require('neotest').summary.open()")
end, { nargs = 0 })

-- Run Vitest Tests
vim.api.nvim_create_user_command("Vitest", function()
  vim.cmd("lua require('neotest').run.run(vim.fn.expand('%'))")
  vim.cmd("lua require('neotest').summary.open()")
end, { nargs = 0 })

vim.api.nvim_create_user_command("VitestNearest", function()
  vim.cmd("lua require('neotest').run.run({ vitestCommand = 'npx vitest run' })")
end, { nargs = 0 })

vim.api.nvim_create_user_command("Note", function()
  vim.cmd("vnew notes.md")
end, {})

vim.api.nvim_create_user_command("Editorconfig", function()
  local filewrite = io.open(".editorconfig", "w")
  if filewrite ~= nil then
    filewrite:write([[
root = true

[*]
indent_size = 2
indent_style = space
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true
quote_type=double

[*.md]
trim_trailing_whitespace = false
		]])
    filewrite:close()
  else
    print("Error")
  end
end, {})

vim.api.nvim_create_user_command("CopyRelPath", function()
  local rel_path = vim.fn.expand("%")
  vim.fn.setreg("+", rel_path)
  print("Copied relative path: " .. rel_path)
end, {})

local links = {
  { "vuetify", "https://v2.vuetifyjs.com/en/" },
  { "vue2", "https://v2.vuejs.org/" },
  { "vue3", "https://vuejs.org/guide/introduction.html" },
  { "nuxt3", "https://nuxt.com/docs" },
  { "tw", "https://tailwindcss.com/docs/customizing-colors" },
  { "gh", "https://github.com/" },
  { "3000", "http://localhost:3000/" },
  { "8895", "http://localhost:8895/" },
  { "5173", "http://localhost:5173/" },
  { "go", "http://google.com" },
  { "mdn", "https://developer.mozilla.org/en-US/" },

  -- JOB SPECIFIC LINKS
}

for i = 1, #links do
  local cmdAppend = links[i][1]
  local url = links[i][2]
  vim.api.nvim_create_user_command("Open" .. cmdAppend, "silent !open " .. url, {})
end
