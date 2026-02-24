vim.api.nvim_create_autocmd("FileType", {
	pattern = "hyprlang",
	callback = function()
		vim.schedule(function()
			vim.opt_local.foldlevel = 99
			vim.opt_local.foldmethod = "marker"
			vim.opt_local.foldmarker = "{{{,}}}"
		end)
	end,
})
