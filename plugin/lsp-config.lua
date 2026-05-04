-- lsp keymaps and other configs

now_if_args(function()
   vim.pack.add({
      gh("neovim/nvim-lspconfig"),
      gh("nmac427/guess-indent.nvim"),
      gh("j-hui/fidget.nvim"),
   })

   require("fidget").setup({})
   require("guess-indent").setup({})
   vim.lsp.config.sourcekit = {
      cmd = { "xcrun", "sourcekit-lsp" },
      filetypes = { "swift" },
      root_markers = {
         "buildServer.json",
         "*.xcodeproj",
         "*.xcworkspace",
         ".git",
         "Package.swift",
      },
      capabilities = require("blink.cmp").get_lsp_capabilities(),
   }

   vim.lsp.enable("sourcekit")
   vim.lsp.enable("copilot")

   -- "gra" (Normal and Visual mode) is mapped to |vim.lsp.buf.code_action()|
   -- "gri" is mapped to |vim.lsp.buf.implementation()|
   -- "grn" is mapped to |vim.lsp.buf.rename()|
   -- "grr" is mapped to |vim.lsp.buf.references()|
   -- "grt" is mapped to |vim.lsp.buf.type_definition()|
   -- "grx" is mapped to |vim.lsp.codelens.run()|
   -- "gO" is mapped to |vim.lsp.buf.document_symbol()|
   -- |v_an| and |v_in| fall back to LSP |vim.lsp.buf.selection_range()| if
   --   treesitter is not active.
   -- |gx| handles `textDocument/documentLink`. Example: with gopls, invoking gx
   map("n", "gd", function()
      --   on "os" in this Go code will open documentation externally: >
      vim.lsp.buf.definition()
   end, "Goto Definition")
   map("n", "gk", function()
      vim.lsp.buf.hover({ border = "rounded" })
   end, "Hover Documentation")
   map("n", "<leader>ih", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
   end, "Enable Inlay Hint")
end)
