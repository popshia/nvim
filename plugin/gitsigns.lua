-- gitsigns integration in nvim

later(function()
   vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

   -- keymaps
   map("n", "]g", "<cmd>Gitsigns next_hunk<CR>", "Next Hunk")
   map("n", "[g", "<cmd>Gitsigns prev_hunk<CR>", "Prev Hunk")
   map("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>", "Blame")
   map("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", "Preview Hunk")

   -- setup
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
end)
