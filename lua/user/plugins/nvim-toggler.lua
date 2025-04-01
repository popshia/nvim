-- toggle text like true false etc...

return {
   "nguyenvukhang/nvim-toggler",
   event = {
      "BufReadPre",
      "BufNewFile",
   },
   keys = {
      { "<leader>i", function() require("nvim-toggler").toggle() end, desc = "Toggle Variable" },
   },
   opts = {
      inverses = {
         ["before"] = "after",
      },
   },
}
