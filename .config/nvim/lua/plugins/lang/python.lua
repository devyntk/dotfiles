return {
    {
        "williamboman/mason.nvim",
        opts = {
            install = {
                "pyright",
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "python",
            },
        },
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                python = function(bufnr)
                    if
                        require("conform").get_formatter_info(
                            "ruff_format",
                            bufnr
                        ).available
                    then
                        return {
                            "ruff_organize_imports",
                            "ruff_fix",
                            "ruff_format",
                        }
                    else
                        return { "isort", "black" }
                    end
                end,
            },
        },
    },
    {
        "mfussenegger/nvim-lint",
        opts = {
            linter_selection = {
                python = function(_)
                    return require("helpers.python").get_linters()
                end,
            },
        },
    },
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        opts = {
            on_venv_activate_callback = function()
                require("lint").linters_by_ft.python =
                    require("helpers.python").get_linters()
            end,
        },
        event = "VeryLazy",
        branch = "regexp",
        keys = {
            { "<leader>v", "<cmd>VenvSelect<cr>" },
        },
    },
    {
        "UN-9BOT/nvim-lspimport",
        branch = "nvim11", -- upstream does not support nvim 0.11 api, using fork
        opts = {},
        keys = {
            { "<leader>li", function() require("lspimport").import() end , desc = "Automatic Import" }
        },
    }
}
