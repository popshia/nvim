-- indentation indicator

return {
   "shellRaining/hlchunk.nvim",
   event = { "BufReadPre", "BufNewFile" },
   ---@module "hlchunk"
   ---@type HlChunk.UserConf
   opts = {
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
   },
}
