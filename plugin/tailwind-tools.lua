-- tailwind-tools.lua

on_filetype("html", function()
   vim.pack.add({ gh("luckasRanarison/tailwind-tools.nvim") })

   require("tailwind-tools").setup({
      document_color = {
         enabled = false,
      },
      conceal = {
         enabled = false,
      },
   })
end)
