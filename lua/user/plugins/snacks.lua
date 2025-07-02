-- several qol plugins

return {
   "folke/snacks.nvim",
   priority = 1000,
   lazy = false,
   ---@diagnostic disable: undefined-global
   keys = {
      -- lsp
      {
         "<leader>ds",
         function()
            Snacks.picker.lsp_symbols()
         end,
         desc = "Document Symbols",
      },
      {
         "<leader>ws",
         function()
            Snacks.picker.lsp_workspace_symbols()
         end,
         desc = "Workspace Symbols",
      },
      -- search
      {
         "<leader>sf",
         function()
            Snacks.picker.smart()
         end,
         desc = "Search Files",
      },
      {
         "<leader>st",
         function()
            Snacks.picker.grep()
         end,
         desc = "Search Text",
      },
      {
         "<leader>sr",
         function()
            Snacks.picker.recent()
         end,
         desc = "Search Recent Files",
      },
      {
         "<leader>sk",
         function()
            Snacks.picker.keymaps({ layout = "select" })
         end,
         desc = "Search Keymaps",
      },
      {
         "<leader>si",
         function()
            Snacks.picker.icons({ layout = "select" })
         end,
         desc = "Icons",
      },
      {
         "<leader>sm",
         function()
            Snacks.picker.notifications()
         end,
         desc = "Notification History",
      },
      {
         "<leader>su",
         function()
            Snacks.picker.undo()
         end,
         desc = "Undo History",
      },
      {
         "<leader>sb",
         function()
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
         end,
         desc = "Search Buffers",
      },
      -- git
      {
         "<leader>lg",
         function()
            Snacks.lazygit()
         end,
         desc = "Lazygit",
      },
      {
         "<leader>gs",
         function()
            Snacks.picker.git_status()
         end,
         desc = "Open changed file",
      },
      {
         "<leader>gl",
         function()
            Snacks.picker.git_log()
         end,
         desc = "Checkout commit",
      },
      -- todo
      {
         "<leader>sd",
         function()
            Snacks.picker.todo_comments()
         end,
         desc = "Search Todos",
      },
      {
         "<leader>sn",
         function()
            Snacks.picker.files({ cwd = vim.fn.stdpath("config"), layout = "select" })
         end,
         desc = "Find Neovim Files",
      },
      -- other
      {
         "<leader>bd",
         function()
            Snacks.bufdelete()
         end,
         desc = "Delete Buffer",
      },
      {
         "Q",
         function()
            Snacks.bufdelete()
         end,
         desc = "Delete Buffer",
      },
   },
   ---@type snacks.Config
   opts = {
      animate = { enabled = true },
      bigfile = { enabled = true },
      input = { enabled = true },
      rename = { enabled = true },
      notifier = { enabled = true },
      picker = { enabled = true },
      words = { enabled = false },
      image = { enabled = false },
      dashboard = {
         enabled = true,
         preset = {
            ---@diagnostic disable: undefined-doc-name
            ---@type snacks.dashboard.Item[]
            keys = {
               { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
               { icon = " ", key = "t", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
               { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
               { icon = " ", key = "c", desc = "Leetcode", action = ":Leet", enabled = package.loaded.lazy ~= nil },
               { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
               { icon = "󰏓 ", key = "m", desc = "Mason", action = ":Mason" },
               -- { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
               { icon = "󰩈 ", key = "q", desc = "Quit", action = ":qa" },
            },
            header = [[
                      _
   ____   ___   ____  _   _   (_) ____ ___
   / __ \ / _ \ / __ \| | / / / / / __ `__ \
  / / / //  __// /_/ /| |/ / / / / / / / / /
/_/ /_/ \___/ \____/ |___/ /_/ /_/ /_/ /_/]],
         },
         sections = {
            { section = "header", padding = 3 },
            { section = "keys", gap = 1, padding = 2 },
            { section = "startup", icon = "  " },
         },
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
