-- the GOAT of fm.

vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

require("keymaps")
map("n", "<leader>e", function()
   require("oil").toggle_float()
end, "File Explorer")

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
