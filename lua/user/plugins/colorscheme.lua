-- colorscheme

return {
   "sainnhe/gruvbox-material",
   dependencies = {
      "ellisonleao/gruvbox.nvim",
   },
   lazy = false,
   priority = 1000,
   init = function()
      -- g:gruvbox_material_background: hard, medium, soft
      vim.g.gruvbox_material_background = "medium"
      -- g:gruvbox_material_foreground & gruvbox_material_statusline_style: material, mix, original
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_statusline_style = "mix"
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_dim_inactive_windows = 1
      require("gruvbox").setup({
         terminal_colors = true, -- add neovim terminal colors
         undercurl = true,
         underline = true,
         bold = true,
         italic = {
            strings = true,
            emphasis = true,
            comments = true,
            operators = false,
            folds = true,
         },
         strikethrough = true,
         invert_selection = false,
         invert_signs = false,
         invert_tabline = false,
         invert_intend_guides = false,
         inverse = true, -- invert background for search, diffs, statuslines and errors
         contrast = "soft", -- can be "hard", "soft" or empty string
         palette_overrides = {},
         overrides = {},
         dim_inactive = false,
         transparent_mode = false,
      })
      vim.cmd.colorscheme("gruvbox-material")
   end,
}
