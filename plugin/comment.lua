-- comment utilities

later(function()
   vim.pack.add({ gh("numToStr/Comment.nvim") })
   require("Comment").setup()
end)
