-- vim markdown mode

return {
   "MeanderingProgrammer/markdown.nvim",
   main = "render-markdown",
   ft = "markdown",
   dependencies = {
      { "preservim/vim-markdown" },
      {
         "iamcco/markdown-preview.nvim",
         build = function()
            vim.fn["mkdp#util#install"]()
         end,
      },
      -- {
      -- 	"lukas-reineke/headlines.nvim",
      -- 	opts = {},
      -- },
   },
   opts = {},
}
