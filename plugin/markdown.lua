-- markdown mode

on_filetype("markdown", function()
   vim.pack.add({ gh("OXY2DEV/markview.nvim") })
   require("markview").setup({
      preview = {
         icon_provider = "mini",
      },
   })
end)
