local M = {}

M.get_linters = function()
    if require("conform").get_formatter_info("black").available then
        return { "ruff" }
    elseif require("conform").get_formatter_info("black").available then
        return { "black", "isort" }
    end
    return { "ruff" }
end

return M
