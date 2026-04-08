-- show search count using "/"

on_event("CmdlineEnter", function()
   vim.cmd("packadd nohlsearch")
   vim.pack.add({ gh("kevinhwang91/nvim-hlslens") })

   map("n", "n", function()
      vim.cmd("normal!" .. vim.v.count1 .. "n")
      vim.api.nvim_feedkeys("zz", "n", false)
      require("hlslens").start()
   end, "Next Hlslens Search")
   map("n", "N", function()
      vim.cmd("normal!" .. vim.v.count1 .. "N")
      vim.api.nvim_feedkeys("zz", "n", false)
      require("hlslens").start()
   end, "Previous Hlslens Search")
   map("n", "*", function()
      vim.api.nvim_feedkeys("*zz", "n", false)
      require("hlslens").start()
   end)
   map("n", "#", function()
      vim.api.nvim_feedkeys("#zz", "n", false)
      require("hlslens").start()
   end)
   map("n", "g*", function()
      vim.api.nvim_feedkeys("g*zz", "n", false)
      require("hlslens").start()
   end)
   map("n", "g#", function()
      vim.api.nvim_feedkeys("g#zz", "n", false)
      require("hlslens").start()
   end)

   require("hlslens").setup({
      opts = {
         calm_down = true,
         nearest_only = true,
         nearest_float_when = "auto",
      },
   })
end)
