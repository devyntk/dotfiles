-- Highlight, edit, and navigate code
return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        opts_extend = { "ensure_installed" },
        opts = {
            -- Add languages to be installed here that you want installed for treesitter
            ensure_installed = {
                "bash",
                "csv",
                "diff",
                "git_rebase",
                "json",
                "just",
                "kdl",
                "regex",
                "toml",
                "vim",
                "yaml",
            },
        },
        config = function(_, opts)
            require("nvim-treesitter").setup()
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    -- Enable treesitter highlighting and disable regex syntax
                    pcall(vim.treesitter.start)
                    -- Enable treesitter-based indentation
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
            local alreadyInstalled = require("nvim-treesitter.config").get_installed()
            local parsersToInstall = vim.iter(opts.ensure_installed)
                :filter(function(parser) return not vim.tbl_contains(alreadyInstalled, parser) end)
                :totable()
            require("nvim-treesitter").install(parsersToInstall)
        end,
    },
}
