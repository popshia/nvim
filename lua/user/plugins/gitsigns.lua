-- gitsigns integration in nvim

return {
   "lewis6991/gitsigns.nvim",
   event = {
      "BufReadPre",
      "BufNewFile",
   },
   keys = {
      { "]g", "<cmd>Gitsigns next_hunk<CR>", desc = "Next Hunk" },
      { "[g", "<cmd>Gitsigns prev_hunk<CR>", desc = "Prev Hunk" },
      { "<leader>gb", "<cmd>Gitsigns blame_line<CR>", desc = "Blame" },
      { "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview Hunk" },
   },
   opts = {
      signs = {
         add = { text = "│" }, -- "+"
         change = { text = "│" }, -- "~"
         delete = { text = "_" }, -- "-"
         topdelete = { text = "‾" },
         changedelete = { text = "~" },
         untracked = { text = "┆" },
      },
   },
}
