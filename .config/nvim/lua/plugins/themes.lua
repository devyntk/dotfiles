-- Themes
return {
	{
		"rose-pine/nvim",
		name = "rose-pine",
		opts = {
			variant = "auto"
		}
	},
	{
	    "zaldih/themery.nvim",
		lazy = false,
		opts = {
			themes = {"rose-pine-main", "rose-pine-dawn", "rose-pine-moon"}
		  }
	},
}
