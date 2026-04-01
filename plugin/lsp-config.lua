-- lsp keymaps and other configs

now_if_args(function()
   vim.pack.add({
      "https://github.com/neovim/nvim-lspconfig",
   })

   -- keymaps
   map("n", "gd", function()
      vim.lsp.buf.definition()
   end, "Goto Definition")
   map("n", "gr", function()
      Snacks.picker.lsp_references({ layout = "bottom" })
   end, "Goto Reference")
   map("n", "gi", function()
      Snacks.picker.lsp_implementations({ layout = "bottom" })
   end, "Goto Implementation")
   map("n", "gk", function()
      vim.lsp.buf.hover({ border = "rounded" })
   end, "Hover Documentation")
   map("n", "gs", function()
      vim.lsp.buf.signature_help()
   end, "Signature Help")
   map("n", "<leader>ds", function()
      Snacks.picker.lsp_symbols()
   end, "Enable Inlay Hint")
   map("n", "<leader>rn", function()
      vim.lsp.buf.rename()
   end, "Rename")
   map("n", "<leader>ca", function()
      vim.lsp.buf.code_action()
   end, "Code Actions")
   map("n", "<leader>ih", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
   end, "Enable Inlay Hint")

   -- setup
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
