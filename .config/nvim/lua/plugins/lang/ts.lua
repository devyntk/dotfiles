return {
    {
        "mason-org/mason.nvim",
        opts = {
            install = {
                "eslint-lsp",
                "typescript-language-server",
                "svelte-language-server",
                "prettierd",
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "css",
                "html",
                "javascript",
                "jsdoc",
                "scss",
                "svelte",
                "typescript",
            },
        },
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                typescript = { "prettierd" },
                javascript = { "prettierd" },
                svelte = { "prettierd" },
            },
        },
    },
}
