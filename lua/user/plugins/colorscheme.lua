-- colorscheme

return {
   "sainnhe/gruvbox-material",
   lazy = false,
   priority = 1000,
   init = function()
      vim.g.gruvbox_material = {
         background = "medium", -- hard, medium, soft
         foreground = "mix", -- material, mix, original
         statusline_style = "mix",
         enable_italic = 1,
         enable_bold = 1,
         better_performance = 1,
         dim_inactive_windows = 1,
      }
      vim.cmd.colorscheme("gruvbox-material")
   end,
}
