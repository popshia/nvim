-- bufferline enhancement

return {
   "akinsho/bufferline.nvim",
   ---@module "bufferline"
   ---@type bufferline.UserConfig
   opts = {
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
   },
}
