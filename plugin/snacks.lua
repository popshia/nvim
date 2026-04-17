-- several QOL plugins

now_if_args(function()
   vim.pack.add({ gh("folke/snacks.nvim") })

   require("snacks").setup({
      bigfile = { enabled = true },
      input = { enabled = true },
      rename = { enabled = true },
      notifier = { enabled = true },
      picker = { enabled = true },
      image = { enabled = true },
      styles = {
         input = {
            relative = "cursor",
            row = -3,
            width = 30,
         },
      },
   })

   -- search
   map("n", "<leader>sf", function()
      Snacks.picker.files()
   end, "Search Files")
   map("n", "<leader>st", function()
      Snacks.picker.grep()
   end, "Search Text")
   map("n", "<leader>sr", function()
      Snacks.picker.recent()
   end, "Recent Files")
   map("n", "<leader>sk", function()
      Snacks.picker.keymaps({ layout = "select" })
   end, "Search Keymaps")
   map("n", "<leader>si", function()
      Snacks.picker.icons({ layout = "select" })
   end, "Search Icons")
   map("n", "<leader>sm", function()
      Snacks.picker.notifications({
         layout = "ivy",
         on_show = function()
            vim.cmd.stopinsert()
         end,
      })
   end, "Search Notifications")
   map("n", "<leader>sb", function()
      Snacks.picker.buffers({
         layout = "vscode",
         on_show = function()
            vim.cmd.stopinsert()
         end,
         win = {
            input = { keys = { ["d"] = "bufdelete" } },
            list = { keys = { ["d"] = "bufdelete" } },
         },
      })
   end, "Search Buffers")
   -- miscs
   map("n", "<leader>q", function()
      Snacks.bufdelete()
   end, "Delete Buffer")
end)
