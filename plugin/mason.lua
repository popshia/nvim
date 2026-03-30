-- mason

vim.pack.add({
   "https://github.com/mason-org/mason-lspconfig.nvim",
   "https://github.com/mason-org/mason.nvim",
   "https://github.com/neovim/nvim-lspconfig",
})

require("keymaps")
map("n", "<leader>ms", "<cmd>Mason<cr>", "Mason")

vim.api.nvim_create_autocmd({ "VimEnter", "BufReadPre" }, {
   callback = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
         ensure_installed = {
            "basedpyright",
            "eslint",
            "html",
            "lua_ls",
            "markdown_oxide",
            "ruff",
            "tailwindcss",
            "ts_ls",
         },
         automatic_installation = true,
         automatic_enable = true,
      })
   end,
})
