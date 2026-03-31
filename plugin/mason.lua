-- mason

vim.pack.add({
   "https://github.com/mason-org/mason-lspconfig.nvim",
   "https://github.com/mason-org/mason.nvim",
   "https://github.com/neovim/nvim-lspconfig",
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
   once = true,
   callback = function()
      -- keymaps
      require("keymaps")

      map("n", "<leader>ms", "<cmd>Mason<cr>", "Mason")

      -- setup
      require("mason").setup()
      require("mason-lspconfig").setup({
         ensure_installed = {
            "basedpyright",
            "lua_ls",
            "markdown_oxide",
            "ruff",
         },
         automatic_installation = true,
         automatic_enable = true,
      })
   end,
})
