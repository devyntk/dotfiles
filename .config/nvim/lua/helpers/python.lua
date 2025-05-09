local M = {}

M.get_linters = function()
    if require("conform").get_formatter_info("ruff_format").available then
        return { "ruff" }
    end
    return { "pylint", "flake8" }
end

return M
