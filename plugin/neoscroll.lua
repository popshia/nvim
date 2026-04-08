-- smooth scrolling

later(function()
   vim.pack.add({ gh("karb94/neoscroll.nvim") })

   require("neoscroll").setup({
      stop_eof = false,
      respect_scrolloff = false,
      performance_mode = true,
      post_hook = function()
         vim.cmd("norm! zz")
      end,
   })
end)
