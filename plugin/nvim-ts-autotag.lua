-- auto change and close tag

on_filetype("html", function()
   vim.pack.add({ gh("windwp/nvim-ts-autotag") })
end)
