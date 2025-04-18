return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "puppet",
                "ruby",
            },
        },
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                puppet = { "puppet-lint" },
            },
            formatters = {
                ["puppet-lint"] = {
                    append_args = function()
                        local puppetlint = vim.fs.find(
                            { ".puppetlint.rc" },
                            { type = "file" }
                        )

                        if #puppetlint > 0 then
                            return { "--config=", puppetlint[1] }
                        end
                        return nil
                    end,
                },
            },
        },
    },
    {
        "mfussenegger/nvim-lint",
        opts = {
            linters = {
                puppet = { "puppet-lint" },
            },
            linter_overrides = {
                ["puppet-lint"] = function(linter)
                    local puppetlint = vim.fs.find(
                        { ".puppetlint.rc" },
                        { type = "file" }
                    )

                    if #puppetlint > 0 then
                        linter.args = {
                            "--no-autoloader_layout-check",
                            "--log-format",
                            "%{path}:%{line}:%{column}:%{kind}:%{check}:%{message}",
                            "--config=",
                            puppetlint[1],
                        }
                    end
                end,
            },
        },
    },
}
