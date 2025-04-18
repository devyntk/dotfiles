local opts = {
    shiftwidth = 4,
    tabstop = 4,
    expandtab = true,
    wrap = false,
    termguicolors = true,
    number = true,
}

-- Set options from table
for opt, val in pairs(opts) do
    vim.o[opt] = val
end

if vim.g.neovide then
    vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
    vim.keymap.set("v", "<D-c>", '"+y') -- Copy
    vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
    vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
    vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
    vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap(
    "",
    "<D-v>",
    "+p<CR>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "!",
    "<D-v>",
    "<C-R>+",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "t",
    "<D-v>",
    "<C-R>+",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "v",
    "<D-v>",
    "<C-R>+",
    { noremap = true, silent = true }
)

-- Set other options
vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = true,
    signs = {
        active = { Error = " ", Warn = " ", Hint = " ", Info = " " },
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})
