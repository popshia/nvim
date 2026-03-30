-- keymap hints

vim.pack.add({ "https://github.com/folke/which-key.nvim" })

require("keymaps")

map("n", "<leader>/", function()
   require("which-key").show({ global = false })
end, "Buffer Local Keymaps")

require("which-key").setup({
   preset = "helix",
})
