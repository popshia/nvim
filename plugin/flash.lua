-- quickly jump to text

now_if_args(function()
   vim.pack.add({ gh("folke/flash.nvim") })

   map({ "n", "x", "o" }, "s", function()
      require("flash").jump()
   end, "Flash")
   map("o", "r", function()
      require("flash").remote()
   end, "Remote Flash")

   require("flash").setup({
      opts = {
         ---@type Flash.Config
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
   })
end)
