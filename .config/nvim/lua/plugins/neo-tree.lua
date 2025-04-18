-- Nicer filetree than NetRW
return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        lazy = false,
        opts = {
            close_if_last_window = true,
            filesystem = {
                use_libuv_file_watcher = true,
                follow_current_file = {
                    enabled = true,
                },
            },
        },
        keys = {
            {
                "<leader>e",
                "<cmd>Neotree toggle<cr>",
                { "n", "v" },
                desc = "Toggle file explorer",
            },
        },
    },
}
