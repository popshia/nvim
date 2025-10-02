-- vim markdown mode

return {
   "OXY2DEV/markview.nvim",
   ft = { "markdown" },
   opts = {
      preview = {
         icon_provider = "mini",
      },
   },
   -- "preservim/vim-markdown",
   -- ft = { "markdown" },
   -- dependencies = {
   --    {
   --       "MeanderingProgrammer/render-markdown.nvim",
   --       ft = "markdown",
   --       ---@module 'render-markdown'
   --       ---@type render.md.UserConfig
   --       opts = {},
   --    },
   -- },
}
