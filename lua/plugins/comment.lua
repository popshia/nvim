-- comment utilities

return {
   "numToStr/Comment.nvim",
   event = { "BufEnter" },
   dependencies = {
      "folke/ts-comments.nvim",
      opts = {},
   },
   opts = {},
}
