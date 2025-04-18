local M = {}

local on_attach = function(client, bufnr)
    -- This function gets run when an LSP connects to a particular buffer.
    local lsp_map = require("helpers.keys").lsp_map

    lsp_map("<leader>lr", vim.lsp.buf.rename, bufnr, "Rename symbol")
    lsp_map("<leader>la", vim.lsp.buf.code_action, bufnr, "Code action")
    lsp_map("<leader>ld", vim.lsp.buf.type_definition, bufnr, "Type definition")
    lsp_map(
        "<leader>ls",
        require("telescope.builtin").lsp_document_symbols,
        bufnr,
        "Document symbols"
    )

    lsp_map("gd", vim.lsp.buf.definition, bufnr, "Goto Definition")
    lsp_map(
        "gr",
        require("telescope.builtin").lsp_references,
        bufnr,
        "Goto References"
    )
    lsp_map("gI", vim.lsp.buf.implementation, bufnr, "Goto Implementation")
    lsp_map("K", vim.lsp.buf.hover, bufnr, "Hover Documentation")
    lsp_map("gD", vim.lsp.buf.declaration, bufnr, "Goto Declaration")

    -- Attach and configure vim-illuminate
    require("illuminate").on_attach(client)
end

M.setup_lsp = function(opts)
    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local cmp_capabilities =
        require("blink.cmp").get_lsp_capabilities(capabilities)
    local default_setup =
        { capabilities = cmp_capabilities, on_attach = on_attach }
    local setup = vim.tbl_deep_extend("force", default_setup, opts)

    local setup_func = function(server_name)
        require("lspconfig")[server_name].setup(setup)
    end
    return setup_func
end

return M
