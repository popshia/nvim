-- lsp keymaps and other configs

vim.pack.add({
   "https://github.com/neovim/nvim-lspconfig",
   "https://github.com/ray-x/lsp_signature.nvim",
})

require("keymaps")

map("n", "gd", function()
   vim.lsp.buf.definition()
end, "Goto Definition")
map("n", "gr", function()
   vim.lsp.buf.references()
end, "Goto Reference")
map("n", "gi", function()
   vim.lsp.buf.implementation()
end, "Goto Implementation")
map("n", "gk", function()
   vim.lsp.buf.hover({ border = "rounded" })
end, "Hover Documentation")
map("n", "gs", function()
   vim.lsp.buf.signature_help()
end, "Signature Help")
map("n", "<leader>rn", function()
   vim.lsp.buf.rename()
end, "Rename")
map("n", "<leader>ca", function()
   vim.lsp.buf.code_action()
end, "Code Actions")
map("n", "<leader>ih", function()
   vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, "Enable Inlay Hint")

require("lsp_signature").setup({
   hint_prefix = {
      above = "↙ ", -- when the hint is on the line above the current line
      current = "← ", -- when the hint is on the same line
      below = "↖ ", -- when the hint is on the line below the current line
   },
})

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
