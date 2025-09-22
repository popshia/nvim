-- lsp keymaps and other configs

return {
   "neovim/nvim-lspconfig",
   event = {
      "BufReadPre",
      "BufNewFile",
   },
   dependencies = {
      {
         "folke/lazydev.nvim",
         ft = "lua",
         opts = {
            library = {
               { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
         },
      },
      {
         "ray-x/lsp_signature.nvim",
         opts = {
            hint_prefix = {
               above = "↙ ", -- when the hint is on the line above the current line
               current = "← ", -- when the hint is on the same line
               below = "↖ ", -- when the hint is on the line below the current line
            },
         },
      },
   },
   keys = {
      { "gd", "<cmd>Trouble lsp_definitions<CR>", desc = "Goto Definition" },
      { "gr", "<cmd>Trouble lsp_references<CR>", desc = "Goto Reference" },
      { "gi", "<cmd>Trouble lsp_implementations<CR>", desc = "Goto Implementation" },
      { "gk", '<cmd>lua vim.lsp.buf.hover({ border = "rounded" })<CR>', desc = "Hover Documentation" },
      { "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature Help" },
      { "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
      { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Actions" },
      { "<leader>li", "<cmd>LspInfo<CR>", desc = "LSP Info" },
   },
   config = function()
      -- diagnostic configs
      vim.diagnostic.config({
         virtual_lines = false,
         virtual_text = false,
         update_in_insert = false,
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
               [vim.diagnostic.severity.HINT] = "",
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
      vim.lsp.config("sourcekit", {
         filetypes = { "swift" },
         capabilities = {
            workspace = {
               didChangeWatchedFiles = {
                  dynamicRegistration = true,
               },
            },
         },
      })
      vim.lsp.enable("sourcekit")
   end,
}
