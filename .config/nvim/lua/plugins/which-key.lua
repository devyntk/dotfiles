return {
    {
        "folke/which-key.nvim",
        config = function()
            local wk = require("which-key")
            wk.setup({
                preset = "modern",
            })
            wk.add({
                { "<leader>f", group = "File" },
                { "<leader>q", group = "Quit" },
                { "<leader>s", group = "Search" },
                { "<leader>l", group = "LSP" },
                { "<leader>u", group = "UI" },
                { "<leader>b", group = "Debugging" },
                { "<leader>g", group = "Git" },
                { "<leader>c", group = "Comment" },
            })
        end,
    },
}
