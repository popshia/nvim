local M = {}

-- TODO: backfill this to template
M.setup = function()
    vim.cmd([[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]])
    vim.cmd([[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

    local signs = {
        { name = "DiagnosticSignError", text = " " },
        { name = "DiagnosticSignWarn", text = " " },
        { name = "DiagnosticSignHint", text = " " },
        { name = "DiagnosticSignInfo", text = " " },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        -- disable virtual text
        virtual_text = {
            prefix = "●",
        },
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })

    vim.cmd([[autocmd CursorHold, CursorHoldI * lua vim.diagnostics.open_float(nil, {focus=false})]])
end

local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
            [[
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
            ]],
            false
        )
    end
end

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    local map = vim.api.nvim_buf_set_keymap
    map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    map(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    map(bufnr, "n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    map(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    map(bufnr, "n", "gk", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    map(bufnr, "n", "gK", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    map(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    map(bufnr, "n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    map(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    map(bufnr, "n", "g[", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
    map(bufnr, "n", "g]", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
    map(bufnr, "n", "gq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

M.on_attach = function(client, bufnr)
    if client.name == "tsserver" then
        client.resolved_capabilities.document_formatting = false
    end
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
    require("illuminate").on_attach(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
