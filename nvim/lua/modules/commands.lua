-- Create feature branch
vim.api.nvim_create_user_command("GF", "Git checkout -b feature/<q-args>", { nargs = 1 })
vim.api.nvim_create_user_command("GA", "Git add .", {})
vim.api.nvim_create_user_command("GC", "Git commit -m <q-args>", { nargs = 1 })
vim.api.nvim_create_user_command("GP", "Git push", {})

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

vim.api.nvim_create_user_command('Note', function ()
	vim.cmd('vnew notes.md')
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
