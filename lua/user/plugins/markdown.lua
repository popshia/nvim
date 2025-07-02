-- vim markdown mode

return {
   "iamcco/markdown-preview.nvim",
   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
   ft = { "markdown" },
   build = "cd app && yarn install",
   dependencies = {
      {
         "MeanderingProgrammer/markdown.nvim",
         main = "render-markdown",
         ft = "markdown",
         opts = {},
      },
      { "preservim/vim-markdown" },
   },
   keys = {
      { "<leader>md", "<cmd>MarkdownPreview<CR>", desc = "Preview Markdown File" },
   },
}
