return {
	{
		"mfussenegger/nvim-lint",
		dependencies = { "stevearc/conform.nvim" },
		init = function()
			local python_linters = { "pylint", "flake8" }
			if require("conform").get_formatter_info("ruff_format").available then
				python_linters = { "ruff" }
			end

			require("lint").linters_by_ft = {
				lua = { "luac" },
				puppet = { "puppet-lint" },
				python = python_linters,
			}
			local puppetlint = vim.fs.find({ ".puppetlint.rc" }, { type = "file" })

			if #puppetlint > 0 then
				require("lint").linters["puppet-lint"].args = {
					"--no-autoloader_layout-check",
					"--log-format",
					"%{path}:%{line}:%{column}:%{kind}:%{check}:%{message}",
					"--config=",
					puppetlint[1],
				}
			end

			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = function(bufnr)
					if require("conform").get_formatter_info("ruff_format", bufnr).available then
						return { "ruff_format" }
					else
						return { "isort", "black" }
					end
				end,
				puppet = { "puppet-lint" },
				terraform = { "terraform" },
				["*"] = { "codespell", "trim_whitespace" },
			},
			formatters = {
				["puppet-lint"] = {
					append_args = function()
						local puppetlint = vim.fs.find({ ".puppetlint.rc" }, { type = "file" })

						if #puppetlint > 0 then
							return { "--config=", puppetlint[1] }
						end
						return nil
					end,
				},
			},
		},
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format()
				end,
				desc = "Format",
			},
		},
	},
}
