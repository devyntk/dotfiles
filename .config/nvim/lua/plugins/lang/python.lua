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
                        return { "ruff_format" }
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
                    if
                        require("conform").get_formatter_info("ruff_format").available
                    then
                        return { "ruff" }
                    end
                    return { "pylint", "flake8" }
                end,
            },
        },
    },
}
