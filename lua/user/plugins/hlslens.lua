-- show search count using "/"

return {
   "kevinhwang91/nvim-hlslens",
   keys = {
      {
         "n",
         function()
            vim.cmd("normal!" .. vim.v.count1 .. "n")
            vim.api.nvim_feedkeys("zz", "n", false)
            require("hlslens").start()
         end,
         desc = "Next Hlslens Search",
      },
      {
         "N",
         function()
            vim.cmd("normal!" .. vim.v.count1 .. "N")
            vim.api.nvim_feedkeys("zz", "n", false)
            require("hlslens").start()
         end,
         desc = "Previous Hlslens Search",
      },
      {
         "*",
         function()
            vim.api.nvim_feedkeys("*zz", "n", false)
            require("hlslens").start()
         end,
      },
      {
         "#",
         function()
            vim.api.nvim_feedkeys("#zz", "n", false)
            require("hlslens").start()
         end,
      },
      {
         "g*",
         function()
            vim.api.nvim_feedkeys("g*zz", "n", false)
            require("hlslens").start()
         end,
      },
      {
         "g#",
         function()
            vim.api.nvim_feedkeys("g3zz", "n", false)
            require("hlslens").start()
         end,
      },
   },
   opts = {
      calm_down = true,
      nearest_only = true,
      nearest_float_when = "auto",
   },
}
