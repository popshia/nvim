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
      { "gk", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover Documentation" },
      { "gj", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Open Float" },
      { "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature Help" },
      { "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
      { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Actions" },
      { "<leader>li", "<cmd>LspInfo<CR>", desc = "LSP Info" },
   },
   config = function()
      -- diagnostic configs
      vim.diagnostic.config({
         virtual_lines = {
            -- current_line = true,
            severity = {
               min = vim.diagnostic.severity.ERROR,
            },
         },
         -- virtual_text = {
         --    severity = {
         --       max = vim.diagnostic.severity.WARN,
         --    },
         -- },
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
      })

      -- icons configs
      local signs = {
         Error = "",
         Warn = "",
         Hint = "󰌵",
         Info = "",
      }
      for type, icon in pairs(signs) do
         local diagnostic_type = "DiagnosticSign" .. type
         vim.fn.sign_define(diagnostic_type, { text = icon, texthl = diagnostic_type, numhl = diagnostic_type })
      end
   end,
}
