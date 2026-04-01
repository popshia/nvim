-- comment utilities

now_if_args(function()
   vim.pack.add({ "https://github.com/numToStr/Comment.nvim" })
   require("Comment").setup()
end)
