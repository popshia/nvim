-- highlight same word in buffer

return {
   "RRethy/vim-illuminate",
   event = {
      "BufReadPre",
      "BufNewFile",
   },
   keys = {
      {
         "[[",
         function()
            require("illuminate")["goto_prev_reference"](false)
         end,
         desc = "Previous Reference",
      },
      {
         "]]",
         function()
            require("illuminate")["goto_next_reference"](false)
         end,
         desc = "Next Reference",
      },
   },
   config = function()
      require("illuminate").configure({
         delay = 0,
         large_file_cutoff = 10000,
         filetypes_denylist = {
            "alpha",
            "mason",
            "lazy",
            "toggleterm",
            "gitcommit",
         },
      })
      vim.api.nvim_set_hl(0, "IlluminatedWord", { underline = true })
      vim.api.nvim_set_hl(0, "IlluminatedWordText", { underline = true })
      vim.api.nvim_set_hl(0, "IlluminatedWordRead", { underline = true })
      vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { underline = true })
   end,
}
