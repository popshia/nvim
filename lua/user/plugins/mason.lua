-- mason

return {
   "mason-org/mason-lspconfig.nvim",
   event = {
      "BufReadPost",
   },
   dependencies = {
      {
         "mason-org/mason.nvim",
         cmd = "Mason",
         keys = {
            { "<leader>ms", "<cmd>Mason<CR>", desc = "Mason" },
         },
         opts = {},
      },
      "neovim/nvim-lspconfig",
   },
   opts = {
      ensure_installed = {
         "basedpyright",
         "bashls",
         "clangd",
         "eslint",
         "html",
         "lua_ls",
         "marksman",
         "tailwindcss",
         "ts_ls",
      },
      automatic_installation = true,
      automatic_enable = true,
   },
}
