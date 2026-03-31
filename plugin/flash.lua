-- quickly jump to text

vim.pack.add({ "https://github.com/folke/flash.nvim" })

vim.api.nvim_create_autocmd("BufEnter", {
   once = true,
   callback = function()
      -- keymaps
      require("keymaps")

      map({ "n", "x", "o" }, "s", function()
         require("flash").jump()
      end, "Flash")
      map("o", "r", function()
         require("flash").remote()
      end, "Remote Flash")

      -- setup
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
   end,
})
