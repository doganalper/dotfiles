return {
	"terrortylor/nvim-comment",
	config = function()
		require("helpers")

		local multiLangFileTypes = { "vue", "astro" }

		require("nvim_comment").setup({
			comment_empty = false,
			hook = function()
				if HasValue(multiLangFileTypes, vim.api.nvim_buf_get_option(0, "filetype")) then
					require("ts_context_commentstring.internal").update_commentstring()
				end
			end,
		})
	end,
}
