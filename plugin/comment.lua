-- comment utilities

vim.pack.add({ "https://github.com/numToStr/Comment.nvim" })

vim.api.nvim_create_autocmd("BufEnter", {
   once = true,
   pattern = "*",
   callback = function()
      require("Comment").setup()
   end,
})
