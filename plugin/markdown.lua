-- markdown mode

on_filetype("markdown", function()
   vim.pack.add({ gh("MeanderingProgrammer/render-markdown.nvim") })
   require("render-markdown").setup({
      completions = { lsp = { enabled = true } },
   })
end)
