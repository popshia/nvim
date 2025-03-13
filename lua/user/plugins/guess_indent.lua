-- auto guess buffer indentation

return {
   "nmac427/guess-indent.nvim",
   event = {
      "BufReadPre",
      "BufNewFile",
   },
   config = {},
}
