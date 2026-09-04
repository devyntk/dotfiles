-- when jedi is installed, only use it for code actions
-- hover and diagnostics come from pyright, so don't duplicate
vim.lsp.config("jedi_language_server", {
    init_options = {
        diagnostics = { enable = false },
        hover = { enable = false },
        ["jediSettings"] = { debug = true },
    },
})

return {
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
                    if require("conform").get_formatter_info("ruff_format", bufnr).available then
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
                python = function(_) return require("helpers.python").get_linters() end,
            },
        },
    },
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        opts = {
            options = {
                on_venv_activate_callback = function()
                    local lint = require("lint")
                    local previous_linters = lint.linters_by_ft["python"]
                    for _, linter in pairs(previous_linters) do
                        vim.diagnostic.reset(lint.get_namespace(linter))
                    end
                    local linters = require("helpers.python").get_linters()
                    lint.linters_by_ft["python"] = linters
                    lint.try_lint()
                end,
            }
        },
        ft = "python",
        keys = {
            { "<leader>v", "<cmd>VenvSelect<cr>" },
            { "<leader>lR", function() require("venv-selector").restart_lsp_servers() end, desc = "Restart Python LSP" },
        },
    },
    {
        "UN-9BOT/nvim-lspimport",
        branch = "nvim11", -- upstream does not support nvim 0.11 api, using fork
        opts = {},
        keys = {
            { "<leader>li", function() require("lspimport").import() end, desc = "Automatic Import" },
        },
    },
}
