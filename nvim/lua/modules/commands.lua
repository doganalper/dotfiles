-- Create feature branch
vim.api.nvim_create_user_command("GF", "Git checkout -b feature/<q-args>", { nargs = 1 })
vim.api.nvim_create_user_command("GA", "Git add .", {})
vim.api.nvim_create_user_command("GC", "Git commit -m <q-args>", { nargs = 1 })
vim.api.nvim_create_user_command("GP", "Git push", {})

-- Turn pixel to rem
vim.api.nvim_create_user_command("TPR", "echo (0.0625 * <q-args>)", { nargs = 1 })

-- Treesitter toggle highlight
vim.api.nvim_create_user_command("TSH", "TSBufToggle highlight", {})

local links = {
	{ "vuetify", "https://v2.vuetifyjs.com/en/" },
	{ "vue2", "https://v2.vuejs.org/" },
	{ "vue3", "https://vuejs.org/guide/introduction.html" },
	{ "tw", "https://tailwindcss.com/docs/customizing-colors" },
	{ "gh", "https://github.com/" },
	{ "local", "http://localhost:3000/" },

	-- JOB SPECIFIC LINKS
	{ "linear", "https://linear.app/storespy/team/DEV/active" },
}

for i = 1, #links do
	local cmdAppend = links[i][1]
	local url = links[i][2]
	vim.api.nvim_create_user_command("Open" .. cmdAppend, "silent !open " .. url, {})
end
