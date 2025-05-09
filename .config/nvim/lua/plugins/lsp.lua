local keys = require("helpers.keys")
-- LSP Configuration & Plugins
return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason-lspconfig.nvim",

            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "RRethy/vim-illuminate",
            "saghen/blink.cmp",
        },
        lazy = false,
        opts_extend = { "install" },
        opts = {
            install = {},
            handlers = {},
        },
        config = function(_, opts)
            require("mason").setup()
            require("mason-tool-installer").setup({
                ensure_installed = opts.install,
            })

            require("mason-lspconfig").setup()
        end,
        keys = {
            { "<leader>M", "<cmd>Mason<cr>", { "n" }, desc = "Show Mason" },
        },
    },
    {
        "saghen/blink.cmp",
        dependencies = "rafamadriz/friendly-snippets",
        version = "*",
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = { preset = "super-tab" },
            signature = { enabled = true },
            sources = {
                default = { "lsp", "path", "snippets", "buffer", "lazydev" },
            },
            fuzzy = { implementation = "prefer_rust" },
        },
    },
    {
        "j-hui/fidget.nvim",
        opts = {
            notification = {
                override_vim_notify = true,
            },
        },
    },
    {
        "dgagn/diagflow.nvim",
        opts = {
            format = function(diagnostic)
                return string.format(
                    "[%s] %s: %s [%s]",
                    diagnostic.source,
                    diagnostic.code,
                    diagnostic.message,
                    vim.diagnostic.severity[diagnostic.severity]
                )
            end,
            scope = "line",
        },
    },
}
