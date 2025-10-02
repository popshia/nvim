-- leetcode

return {
   "kawre/leetcode.nvim",
   build = ":TSUpdate html",
   event = "VeryLazy",
   dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
   },
   keys = {
      { "<leader>ls", "<cmd>Leet submit<CR>", desc = "Leetcode Submit" },
      { "<leader>lr", "<cmd>Leet run<CR>", desc = "Leetcode Run" },
      { "<leader>ll", "<cmd>Leet list<CR>", desc = "Leetcode List" },
      { "<leader>lo", "<cmd>Leet open<CR>", desc = "Leetcode Open" },
      { "<leader>lc", "<cmd>Leet console<CR>", desc = "Leetcode Console" },
   },
   opts = {
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
   },
}
