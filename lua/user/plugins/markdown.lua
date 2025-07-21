-- vim markdown mode

return {
   "preservim/vim-markdown",
   dependencies = {
      {
         "MeanderingProgrammer/markdown.nvim",
         main = "render-markdown",
         ft = "markdown",
         opts = {},
      },
      -- {
      --    "iamcco/markdown-preview.nvim",
      --    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      --    ft = { "markdown" },
      --    build = "cd app && yarn install",
      --    keys = {
      --       { "<leader>md", "<cmd>MarkdownPreview<CR>", desc = "Preview Markdown File" },
      --    },
      -- },
   },
}
