return {
	{
		"dense-analysis/ale",
		init = function()
			vim.g.ale_use_neovim_diagnostics_api = 1
			vim.g.ale_python_auto_virtualenv = 1
		end,
	}
}
