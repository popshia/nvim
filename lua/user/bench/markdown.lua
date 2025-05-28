-- vim markdown mode

return {
   "MeanderingProgrammer/markdown.nvim",
   main = "render-markdown",
   ft = "markdown",
   dependencies = {
      { "preservim/vim-markdown" },
      {
         "iamcco/markdown-preview.nvim",
         cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
         build = "cd app && yarn install",
         init = function()
            vim.g.mkdp_filetypes = { "markdown" }
         end,
         ft = { "markdown" },
      },
   },
   opts = {},
}
