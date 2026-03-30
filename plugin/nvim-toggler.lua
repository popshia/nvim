-- toggle common values

vim.pack.add({ "https://github.com/nguyenvukhang/nvim-toggler" })

require("keymaps")

map("n", "<leader>i", function()
   require("nvim-toggler").toggle()
end, "Toggle Variable")

require("nvim-toggler").setup({
   inverses = {
      ["before"] = "after",
   },
})
