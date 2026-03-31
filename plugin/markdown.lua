-- markdown mode

Config.now_if_args(function()
   vim.pack.add({ "https://github.com/OXY2DEV/markview.nvim" })

   Config.on_filetype("markdown", function()
      require("markview").setup({
         preview = {
            icon_provider = "mini",
         },
      })
   end)
end)
