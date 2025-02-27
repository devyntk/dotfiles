-- Git related plugins
return {
	{
		"lewis6991/gitsigns.nvim",
		tag = "v1.0.1",
		opts = {},
		keys = {
			{
				"<leader>gb",
				"<cmd>Gitsigns blame<cr>",
				desc = "Show git blame",
			},
		},
	},
	{
		"akinsho/git-conflict.nvim",
		tag = "v2.1.0",
		opts = {
			default_mappings = {
				ours = "co",
				theirs = "ct",
				none = "c0",
				both = "cb",
				next = "cn",
				prev = "cp",
			},
		},
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
		},
		opts = {
			kind = "floating",
		},
		keys = {
			{
				"<leader>gc",
				function()
					require("neogit").open({ "commit" })
				end,
				desc = "Commit",
			},
			{
				"<leader>gr",
				function()
					require("neogit").open({ "rebase" })
				end,
				desc = "Rebase",
			},
			{
				"<leader>gf",
				function()
					require("neogit").open({ "fetch" })
				end,
				desc = "Fetch",
			},
			{
				"<leader>ga",
				function()
					require("neogit").open({ "branch" })
				end,
				desc = "Branch",
			},
			{
				"<leader>gg",
				function()
					require("neogit").open()
				end,
				desc = "Open Neogit",
			},
		},
	},
}
