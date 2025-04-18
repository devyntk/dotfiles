return {
    {
        "williamboman/mason.nvim",
        opts = {
            install = {
                "eslint-lsp",
                "typescript-language-server",
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
            },
        },
    },
}
