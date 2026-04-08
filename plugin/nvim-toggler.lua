-- toggle common values

later(function()
   vim.pack.add({ gh("nguyenvukhang/nvim-toggler") })

   map("n", "<leader>i", function()
      require("nvim-toggler").toggle()
   end, "Toggle Variable")

   require("nvim-toggler").setup({
      inverses = {
         ["before"] = "after",
      },
   })
end)
