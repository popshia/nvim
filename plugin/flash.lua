-- quickly jump to text

vim.pack.add({ "https://github.com/folke/flash.nvim" })

require("keymaps")
map({ "n", "x", "o" }, "s", function()
   require("flash").jump()
end, "Flash")
map("o", "s", function()
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
