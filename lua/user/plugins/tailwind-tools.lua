-- tailwind-tools.lua

return {
   "luckasRanarison/tailwind-tools.nvim",
   name = "tailwind-tools",
   build = ":UpdateRemotePlugins",
   ft = "html",
   opts = {
      document_color = {
         enabled = false,
      },
      conceal = {
         enabled = false,
      },
   },
}
