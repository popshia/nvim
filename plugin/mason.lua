-- mason

now_if_args(function()
   vim.pack.add({
      "https://github.com/mason-org/mason-lspconfig.nvim",
      "https://github.com/mason-org/mason.nvim",
      "https://github.com/neovim/nvim-lspconfig",
      "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
   })

   map("n", "<leader>ms", "<cmd>Mason<cr>", "Mason")

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
end)
