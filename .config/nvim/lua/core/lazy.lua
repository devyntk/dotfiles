-- Install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local ok, lazy = pcall(require, "lazy")
if not ok then
    return
end

-- We have to set the leader key here for lazy.nvim to work
require("helpers.keys").set_leader(" ")

lazy.setup({
    spec = {
        { import = "plugins" },
        { import = "plugins.lang" },
    },
    custom_keys = {
        ["<leader>L"] = {
            lazy.show,
            desc = "Show Lazy",
        },
    },
})
