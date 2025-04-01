-- improve yank and put functionalities

return {
   "gbprod/yanky.nvim",
   keys = {
      {
         "<leader>sy",
         function()
            Snacks.picker.yanky({ layout = "dropdown", on_show = function() vim.cmd.stopinsert() end })
         end,
         mode = { "n", "x" },
         desc = "Open Yank History",
      },
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put After" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put Before" },
      { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Global Put After" },
      { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Global Put Before" },
      { "<C-p>", "<Plug>(YankyPreviousEntry)", mode = { "n" }, desc = "Previous Yanky Entry" },
      { "<C-n>", "<Plug>(YankyNextEntry)", mode = { "n" }, desc = "Next Yanky Entry" },
      { "]p", "<Plug>(YankyPutIndentAfterLinewise)", mode = { "n" }, desc = "Put After Line" },
      { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", mode = { "n" }, desc = "Put Before Line" },
      { "]P", "<Plug>(YankyPutIndentAfterLinewise)", mode = { "n" }, desc = "Put After Line" },
      { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", mode = { "n" }, desc = "Put Before Line" },
      { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", mode = { "n" }, desc = "Put After Shift Right" },
      { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", mode = { "n" }, desc = "Put After Shift Left" },
      { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", mode = { "n" }, desc = "Put Before Shift Right" },
      { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", mode = { "n" }, desc = "Put Before Shift Left" },
      { "=p", "<Plug>(YankyPutAfterFilter)", mode = { "n" }, desc = "Put After Filter" },
      { "=P", "<Plug>(YankyPutBeforeFilter)", mode = { "n" }, desc = "Put Before Filter" },
   },
   config = function()
      require("yanky").setup({
         highlight = {
            on_put = true,
            on_yank = true,
            timer = 200,
         },
      })
      vim.api.nvim_set_hl(0, "YankyPut", { link = "IncSearch" })
      vim.api.nvim_set_hl(0, "YankyYanked", { link = "IncSearch" })
   end,
}
