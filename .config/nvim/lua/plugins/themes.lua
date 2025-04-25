-- Stolen and adapted from snacks.picker.sources.vim
local function get_colorschemes()
  local items = {}
  local rtp = vim.o.runtimepath
  if package.loaded.lazy then
    rtp = rtp .. "," .. table.concat(require("lazy.core.util").get_unloaded_rtp(""), ",")
  end
  local files = vim.fn.globpath(rtp, "colors/*", false, true) ---@type string[]
  for _, file in ipairs(files) do
    local name = vim.fn.fnamemodify(file, ":t:r")
    local ext = vim.fn.fnamemodify(file, ":e")
    if ext == "vim" or ext == "lua" then
      items[#items + 1] = name
    end
  end
  return items
end

return {
    {
        "rose-pine/nvim",
        name = "rose-pine",
        opts = {
            variant = "auto",
        },
    },
    { "catppuccin/nvim", name = "catppuccin" },
    {
        "zaldih/themery.nvim",
        lazy = false,
        opts = function()
            return {
                themes = get_colorschemes(),
            }
        end,
    },
}
