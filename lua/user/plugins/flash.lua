-- quickly jump to text

return {
   "folke/flash.nvim",
   event = "VeryLazy",
   keys = {
      {
         "s",
         mode = { "n", "x", "o" },
         function()
            require("flash").jump()
         end,
         desc = "Flash",
      },
      {
         "r",
         mode = "o",
         function()
            require("flash").remote()
         end,
         desc = "Remote Flash",
      },
   },
   ---@type Flash.Config
   opts = {
      search = {
         multi_window = false,
      },
      jump = {
         nohlsearch = true,
         autojump = true,
      },
      label = {
         uppercase = false,
      },
      modes = {
         char = {
            enabled = true,
            jump_labels = true,
            keys = { "f", "F" },
         },
      },
   },
}
