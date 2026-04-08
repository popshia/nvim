-- keymap hints

later(function()
   vim.pack.add({ gh("folke/which-key.nvim") })

   map("n", "<leader>/", function()
      require("which-key").show({ global = false })
   end, "Buffer Local Keymaps")

   require("which-key").setup({
      preset = "helix",
   })
end)
