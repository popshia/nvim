-- indentation indicator

later(function()
   vim.pack.add({ "https://github.com/shellRaining/hlchunk.nvim" })

   require("hlchunk").setup({
      ---@module "hlchunk"
      ---@type HlChunk.UserConf
      chunk = {
         enable = true,
         style = { { fg = "#d3869b" } },
         delay = 100,
         duration = 200,
         exclude_filetypes = {
            terminal = true,
            nofile = true,
            alpha = true,
            help = true,
            dashboard = true,
            lazy = true,
            trouble = true,
            text = true,
         },
      },
      indent = {
         enable = true,
         exclude_filetypes = {
            terminal = true,
            nofile = true,
            alpha = true,
            help = true,
            dashboard = true,
            lazy = true,
            trouble = true,
            text = true,
         },
      },
      line_num = { enable = false },
      blank = { enable = false },
   })
end)
