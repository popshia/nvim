-- auto guess buffer indentation

now_if_args(function()
   vim.pack.add({ gh("nmac427/guess-indent.nvim") })
   require("guess-indent").setup()
end)
