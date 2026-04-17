-- the GOAT of fm.

now(function()
   vim.pack.add({
      gh("stevearc/oil.nvim"),
      gh("malewicz1337/oil-git.nvim"),
   })

   require("oil").setup({
      ---@module "oil"
      ---@type oil.setupOpts
      default_file_explorer = true,
      keymaps = {
         ["h"] = "actions.parent",
         ["l"] = "actions.select",
      },
      view_options = {
         show_hidden = true,
      },
      float = {
         max_width = 100,
         max_height = 50,
      },
      skip_confirm_for_simple_edits = true,
   })

   require("oil-git").setup({
      highlights = {
         OilGitAdded = { fg = "#b0b846" },
         OilGitModifiedStaged = { fg = "#8bba7f" },
         OilGitModifiedUnstaged = { fg = "#80aa9e" },
         OilGitRenamed = { fg = "#e9b143" },
         OilGitDeleted = { fg = "#f2594b" },
         OilGitCopied = { fg = "#cba6f7" },
         OilGitConflict = { fg = "#f28534" },
         OilGitUntracked = { fg = "#a89984" },
         OilGitIgnored = { fg = "#7c6f64" },
      },
   })

   map("n", "<leader>e", function()
      require("oil").toggle_float()
   end, "File Explorer")
end)
