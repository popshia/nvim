-- toggle common values

vim.pack.add({ "https://github.com/nguyenvukhang/nvim-toggler" })

vim.api.nvim_create_autocmd("BufEnter", {
   once = true,
   callback = function()
      -- keymaps
      require("keymaps")

      map("n", "<leader>i", function()
         require("nvim-toggler").toggle()
      end, "Toggle Variable")

      -- setup
      require("nvim-toggler").setup({
         inverses = {
            ["before"] = "after",
         },
      })
   end,
})
