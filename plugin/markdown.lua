-- markdown mode

vim.pack.add({ "https://github.com/OXY2DEV/markview.nvim" })

vim.api.nvim_create_autocmd({ "FileType" }, {
   once = true,
   pattern = { "markdown" },
   callback = function()
      require("markview").setup({
         preview = {
            icon_provider = "mini",
         },
      })
   end,
})
