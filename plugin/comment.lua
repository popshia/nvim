-- comment utilities

vim.pack.add({ "https://github.com/numToStr/Comment.nvim" })

vim.api.nvim_create_autocmd("BufEnter", {
   pattern = "*",
   callback = function()
      require("Comment").setup()
   end,
})
