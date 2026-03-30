-- several QOL plugins

vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("keymaps")

map("n", "<leader>ds", function()
   Snacks.picker.lsp_symbols()
end, "Document Symbols")
map("n", "<leader>ws", function()
   Snacks.picker.lsp_workspace_symbols()
end, "Workspace Symbols")
map("n", "<leader>sf", function()
   Snacks.picker.smart()
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
   Snacks.picker.notifications({ layout = "bottom" })
end, "Search Notifications")
map("n", "<leader>su", function()
   Snacks.picker.undo()
end, "Search Undo History")
map("n", "<leader>sb", function()
   Snacks.picker.buffers({
      layout = "select",
      on_show = function()
         vim.cmd.stopinsert()
      end,
      win = {
         input = { keys = { ["d"] = "bufdelete" } },
         list = { keys = { ["d"] = "bufdelete" } },
      },
   })
end, "Search Buffers")

require("snacks").setup({
   animate = { enabled = false },
   bigfile = { enabled = true },
   input = { enabled = true },
   rename = { enabled = true },
   notifier = { enabled = true },
   picker = { enabled = true },
   words = { enabled = false },
   image = { enabled = true },
   dashboard = { enabled = false },
   styles = {
      input = {
         relative = "cursor",
         row = -3,
         width = 30,
      },
   },
})
