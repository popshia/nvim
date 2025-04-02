-- comment utilities

return {
   "numToStr/Comment.nvim",
   event = {
      "BufReadPre",
      "BufNewFile",
   },
   dependencies = {
      "folke/ts-comments.nvim",
      opts = {},
   },
   opts = {},
}
