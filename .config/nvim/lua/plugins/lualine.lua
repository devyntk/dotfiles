-- Fancier statusline
return {
    "nvim-lualine/lualine.nvim",
    opts = {
        options = {
            icons_enabled = true,
            theme = "auto",
            component_separators = "|",
            section_separators = "",
        },
        sections = {
            lualine_x = {'encoding', 'filetype', 'lsp_status'},
        },
    },
}
