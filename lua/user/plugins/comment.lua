-- better commenting

return {
   "numToStr/Comment.nvim",
   event = {
      "BufReadPre",
      "BufNewFile",
   },
   dependencies = {
      {
         "folke/ts-comments.nvim",
         opts = {},
         enabled = vim.fn.has("nvim-0.10.0") == 1,
      },
   },
   opts = {},
}
