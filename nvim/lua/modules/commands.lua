-- Create feature branch
vim.api.nvim_create_user_command("GF", "Git checkout -b feature/<q-args>", { nargs = 1 })
vim.api.nvim_create_user_command("GA", "Git add .", {})
vim.api.nvim_create_user_command("GC", "Git commit -m <q-args>", { nargs = 1 })
vim.api.nvim_create_user_command("GP", "Git push", {})
vim.api.nvim_create_user_command("GPO", "Git push origin HEAD", {})
vim.api.nvim_create_user_command("TSI", function()
  vim.cmd("norm O // @ts-ignore")
end, {})

-- Turn pixel to rem
vim.api.nvim_create_user_command("TPR", "echo (0.0625 * <q-args>)", { nargs = 1 })

-- Replace string on open buffer
vim.api.nvim_create_user_command("RP", function(val)
	vim.cmd("%s/" .. val.args:gsub(" ", "/") .. "/g")
end, { nargs = 1 })

-- Replace string on line current line
vim.api.nvim_create_user_command("RPL", function(val)
	vim.cmd("s/" .. val.args:gsub(" ", "/") .. "/g")
end, { nargs = 1 })

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

local links = {
	{ "vuetify", "https://v2.vuetifyjs.com/en/" },
	{ "vue2", "https://v2.vuejs.org/" },
	{ "vue3", "https://vuejs.org/guide/introduction.html" },
	{ "nuxt3", "https://nuxt.com/docs" },
	{ "tw", "https://tailwindcss.com/docs/customizing-colors" },
	{ "gh", "https://github.com/" },
	{ "3000", "http://localhost:3000/" },
	{ "8895", "http://localhost:8895/" },
	{ "go", "http://google.com" },

	-- JOB SPECIFIC LINKS
}

for i = 1, #links do
	local cmdAppend = links[i][1]
	local url = links[i][2]
	vim.api.nvim_create_user_command("Open" .. cmdAppend, "silent !open " .. url, {})
end
