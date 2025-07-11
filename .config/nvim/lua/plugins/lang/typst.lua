return {
    {
        "mason-org/mason.nvim",
        opts = {
            install = {
                "tinymist",
                "typstyle",
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "typst",
            },
        },
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                typst = { "typstyle" },
            },
        },
    },
    {
        "chomosuke/typst-preview.nvim",
        ft = "typst",
        version = "1.*",
        opts = {},
    },
}
