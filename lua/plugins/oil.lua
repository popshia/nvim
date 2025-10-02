-- GOAT of file manager

return {
   "stevearc/oil.nvim",
   event = "VimEnter",
   keys = {
      {
         "<leader>e",
         function()
            require("oil").toggle_float()
         end,
         desc = "File Explorer",
      },
   },
   ---@module "oil"
   ---@type oil.setupOpts
   opts = {
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
   },
}
