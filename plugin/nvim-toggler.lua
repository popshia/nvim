-- toggle common values

later(function()
   vim.pack.add({ gh("nguyenvukhang/nvim-toggler") })

   require("nvim-toggler").setup({
      inverses = {
         ["before"] = "after",
      },
   })

   map("n", "<leader>i", function()
      require("nvim-toggler").toggle()
   end, "Toggle Variable")
end)
