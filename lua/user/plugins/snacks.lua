-- several qol plugins

return {
   "folke/snacks.nvim",
   priority = 1000,
   lazy = false,
   ---@diagnostic disable: undefined-global
   keys = {
      -- lsp
      { "<leader>ds", function() Snacks.picker.lsp_symbols() end, desc = "Document Symbols" },
      { "<leader>ws", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Workspace Symbols" },
      -- search
      { "<leader>sf", function() Snacks.picker.smart() end, desc = "Search Files" },
      { "<leader>st", function() Snacks.picker.grep() end, desc = "Search Text" },
      { "<leader>sr", function() Snacks.picker.recent() end, desc = "Search Recent Files" },
      { "<leader>sb", function() Snacks.picker.buffers({ layout = "select" }) end, desc = "Search Buffers" },
      { "<leader>sk", function() Snacks.picker.keymaps({ layout = "select" }) end, desc = "Search Keymaps" },
      { "<leader>sc", function() Snacks.picker.registers({ layout = "dropdown" }) end, desc = "Search Clipboard History" },
      { "<leader>si", function() Snacks.picker.icons({ layout = "select" }) end, desc = "Icons" },
      -- git
      { "<leader>lg", function() Snacks.lazygit() end, desc = "Lazygit" },
      { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Open changed file" },
      { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Checkout commit" },
      -- todo
      { "<leader>sd", function() Snacks.picker.todo_comments() end, desc = "Search Todos" },
      { "<leader>sn", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config"), layout = "select" }) end, desc = "Find Neovim Files" },
      -- other
      { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
   },
   --@type snacks.Config
   opts = {
      animate = { enabled = true },
      bigfile = { enabled = true },
      input = { enabled = true },
      rename = { enabled = true },
      image = { enabled = true },
      notifier = { enabled = true },
      words = { enabled = true },
      picker = {
         enabled = true,
      },
      styles = {
         input = {
            relative = "cursor",
            row = -3,
            width = 30,
         },
      },
   },
   -- layout: bottom, default, dropdown, ivy, ivy_split, left, right, select, sidebar, telescope, top, vertical, vscode
}
