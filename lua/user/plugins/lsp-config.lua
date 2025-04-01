-- lsp keymaps and other configs

return {
   "neovim/nvim-lspconfig",
   event = {
      "BufReadPre",
      "BufNewFile",
   },
   dependencies = {
      { "folke/lazydev.nvim", ft = "lua", opts = {} },
      { "ray-x/lsp_signature.nvim", opts = {} },
   },
   keys = {
      { "gd", "<cmd>Trouble lsp_definitions<CR>", desc = "Goto Definition" },
      { "gr", "<cmd>Trouble lsp_references<CR>", desc = "Goto Reference" },
      { "gi", "<cmd>Trouble lsp_implementations<CR>", desc = "Goto Implementation" },
      { "gk", '<cmd>lua vim.lsp.buf.hover({ border = "rounded" })<CR>', desc = "Hover Documentation" },
      {
         "gj",
         function()
            vim.diagnostic.config({ virtual_lines = { current_line = true }, virtual_text = false })
            vim.api.nvim_create_autocmd("CursorMoved", {
               group = vim.api.nvim_create_augroup("line-diagnostics", { clear = true }),
               callback = function()
                  vim.diagnostic.config({ virtual_lines = false, virtual_text = true })
                  return true
               end,
            })
         end,
         desc = "Toggle Diagnostic Message",
      },
      { "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature Help" },
      { "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
      { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Actions" },
      { "<leader>li", "<cmd>LspInfo<CR>", desc = "LSP Info" },
   },
   config = function()
      -- diagnostic configs
      vim.diagnostic.config({
         virtual_lines = false,
         virtual_text = true,
         update_in_insert = true,
         severity_sort = true,
         float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
            source = true,
            header = "",
            prefix = "",
         },
         signs = {
            text = {
               [vim.diagnostic.severity.ERROR] = "",
               [vim.diagnostic.severity.WARN] = "",
               [vim.diagnostic.severity.HINT] = "󰌵",
               [vim.diagnostic.severity.INFO] = "",
            },
            numhl = {
               [vim.diagnostic.severity.ERROR] = "DiagnosticError",
               [vim.diagnostic.severity.WARN] = "DiagnosticWarning",
               [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
               [vim.diagnostic.severity.HINT] = "DiagnosticHint",
            },
         },
      })

      -- highlight colors
      vim.api.nvim_set_hl(0, "VirtualTextError", { link = "DiagnosticError" })
      vim.api.nvim_set_hl(0, "VirtualTextWarning", { link = "DiagnosticWarning" })
      vim.api.nvim_set_hl(0, "VirtualTextInfo", { link = "DiagnosticInfo" })
      vim.api.nvim_set_hl(0, "VirtualTextHint", { link = "DiagnosticHint" })
   end,
}
