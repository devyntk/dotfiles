return {
    {
        "mfussenegger/nvim-lint",
        dependencies = { "stevearc/conform.nvim" },
        lazy = false, -- nvim-lint has no init function, want to run config() always
        opts = {
            linters = {},
            linter_selection = {},
            linter_overrides = {},
        },
        config = function(_, opts)
            local lint = require("lint")

            lint.linters_by_ft = opts.linters

            for name, override in pairs(opts.linter_selection) do
                lint.linters_by_ft[name] = override(lint.linters_by_ft[name])
            end

            for name, override in pairs(opts.linter_overrides) do
                lint.linters[name] = override(lint.linters[name])
            end

            local lint_events = { "BufRead", "BufWritePost", "InsertLeave" }
            vim.api.nvim_create_autocmd(lint_events, {
                group = vim.api.nvim_create_augroup("NvimLint", {}),
                callback = function()
                    lint.try_lint()
                end,
            })
        end,
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                ["*"] = { "codespell", "trim_whitespace" },
            },
        },
        keys = {
            {
                "<leader>ff",
                function()
                    require("conform").format()
                end,
                desc = "Format",
            },
        },
    },
}
