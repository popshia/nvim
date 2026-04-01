-- toggle common values

later(function()
   vim.pack.add({ "https://github.com/nguyenvukhang/nvim-toggler" })

   -- keymaps
   map("n", "<leader>i", function()
      require("nvim-toggler").toggle()
   end, "Toggle Variable")

   -- setup
   require("nvim-toggler").setup({
      inverses = {
         ["before"] = "after",
      },
   })
end)
