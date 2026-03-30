-- autopairs completions

vim.pack.add({ "https://github.com/windwp/nvim-autopairs" })

vim.api.nvim_create_autocmd("InsertEnter", {
   callback = function()
      require("nvim-autopairs").setup({
         enable_check_bracket_line = false,
      })
   end,
})
