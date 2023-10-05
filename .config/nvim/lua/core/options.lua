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

-- Set other options

vim.diagnostic.config({
	virtual_text = {
		source = "always",
		prefix = "●",
	},
	severity_sort = true,
	float = {
		source = "always",
	}
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local colorscheme = require("helpers.colorscheme")
vim.cmd.colorscheme(colorscheme)
