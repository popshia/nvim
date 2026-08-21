-- leetcode

later(function()
   vim.pack.add({
      gh("nvim-lua/plenary.nvim"),
      gh("MunifTanjim/nui.nvim"),
      gh("kawre/leetcode.nvim"),
   })

   require("leetcode").setup({
      lang = "python3",
      picker = { "snacks-picker" },
      storage = {
         home = "~/repos/leetcode/code",
         cache = "~/repos/leetcode/.cache",
      },
      editor = {
         reset_previous_code = false,
      },
      theme = {
         ["normal"] = {
            fg = "#a89984",
         },
         easy = { fg = "#b0b846" },
         medium = { fg = "#e9b143" },
         hard = { fg = "#f2594b" },
      },
   })

   map("n", "<leader>ls", "<cmd>Leet submit<CR>", "Leetcode Submit")
   map("n", "<leader>lr", "<cmd>Leet run<CR>", "Leetcode Run")
   map("n", "<leader>ll", "<cmd>Leet list<CR>", "Leetcode List")
   map("n", "<leader>lo", "<cmd>Leet open<CR>", "Leetcode Open")
   map("n", "<leader>lc", "<cmd>Leet console<CR>", "Leetcode Console")
end)
