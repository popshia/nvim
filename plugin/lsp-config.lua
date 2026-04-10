-- lsp keymaps and other configs

now_if_args(function()
   vim.pack.add({
      gh("neovim/nvim-lspconfig"),
      gh("nmac427/guess-indent.nvim"),
      gh("j-hui/fidget.nvim"),
      gh("Bekaboo/dropbar.nvim"),
   })

   require("fidget").setup({})
   require("guess-indent").setup({})

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
   --   on "os" in this Go code will open documentation externally: >

   map("n", "gd", function()
      vim.lsp.buf.definition()
   end, "Goto Definition")
   map("n", "gk", function()
      vim.lsp.buf.hover({ border = "rounded" })
   end, "Hover Documentation")
   map("n", "<leader>ih", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
   end, "Enable Inlay Hint")
   map("n", "<leader>;", function()
      require("dropbar.api").pick()
   end, "Pick Dropbar Item")
   -- map("n", "gr", function()
   --    Snacks.picker.lsp_references({ layout = "bottom" })
   -- end, "Goto Reference")
   -- map("n", "gi", function()
   --    Snacks.picker.lsp_implementations({ layout = "bottom" })
   -- end, "Goto Implementation")
   -- map("n", "<leader>ds", function()
   --    Snacks.picker.lsp_symbols()
   -- end, "Document Symbols")

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
end)
