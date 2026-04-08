-- bufferline enhancement

later(function()
   vim.pack.add({ gh("akinsho/bufferline.nvim") })

   require("bufferline").setup({
      ---@module "bufferline"
      ---@type bufferline.UserConfig
      options = {
         -- diagnostics = "nvim_lsp",
         numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
         show_close_icon = false,
         separator_style = "thin", -- | "thick" | "thin" | "slant" | "padded_slant"
         indicator = {
            icon = "▎", -- this should be omitted if indicator style is not 'icon'
            -- style = 'icon' | 'underline' | 'none',
         },
      },
   })
end)
