-- mason

now_if_args(function()
   vim.pack.add({
      gh("mason-org/mason-lspconfig.nvim"),
      gh("mason-org/mason.nvim"),
      gh("neovim/nvim-lspconfig"),
      gh("WhoIsSethDaniel/mason-tool-installer.nvim"),
   })

   require("mason").setup()
   require("mason-lspconfig").setup({
      automatic_installation = true,
      automatic_enable = true,
   })
   require("mason-tool-installer").setup({
      ensure_installed = {
         "basedpyright",
         "codespell",
         "copilot-language-server",
         "fish-lsp",
         "lua-language-server",
         "markdown-oxide",
         "ruff",
         "stylua",
      },
      auto_update = true,
   })

   map("n", "<leader>ms", "<cmd>Mason<cr>", "Mason")
end)
