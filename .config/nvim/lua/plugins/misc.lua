-- Miscelaneous fun stuff
return {
	-- Comment with haste
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	-- Move stuff with <M-j> and <M-k> in both normal and visual mode
	{
		"echasnovski/mini.move",
		config = function()
			require("mini.move").setup()
		end,
	},
	-- Better buffer closing actions.
	{
		"kazhala/close-buffers.nvim",
		opts = {
			preserve_window_layout = { "this", "nameless" },
		},
	},
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	"tpope/vim-surround", -- Surround stuff with the ys-, cs-, ds- commands
	{
		"embear/vim-localvimrc", -- Source .lvimrc files
		init = function()
			vim.g.localvimrc_persistent = 1
		end,
	},
	"lewis6991/spaceless.nvim",
	{
		"rcarriga/nvim-notify",
		opts = {
			render = "wrapped-compact",
		},
	},
}
