-- gitsigns integration in nvim

later(function()
   vim.pack.add({ gh("lewis6991/gitsigns.nvim") })

   require("gitsigns").setup({
      signs = {
         add = { text = "│" }, -- "+"
         change = { text = "│" }, -- "~"
         delete = { text = "_" }, -- "-"
         topdelete = { text = "‾" },
         changedelete = { text = "~" },
         untracked = { text = "┆" },
      },
   })

   map("n", "]g", "<cmd>Gitsigns next_hunk<CR>", "Next Hunk")
   map("n", "[g", "<cmd>Gitsigns prev_hunk<CR>", "Prev Hunk")
   map("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>", "Blame")
   map("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", "Preview Hunk")
end)
