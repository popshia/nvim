-- mini plugins

return {
   "echasnovski/mini.nvim",
   version = false,
   config = function()
      -- Extend and create a/i textobjects
      require("mini.ai").setup()
      -- Go forward/backward with square brackets
      require("mini.bracketed").setup({
         file = {
            suffix = "",
            options = {},
         },
      })
      -- Split/Join arguments
      require("mini.splitjoin").setup({ mappings = {
         toggle = "<leader>sj",
      } })
      -- Surround
      require("mini.surround").setup({
         mappings = {
            add = "ys",
            delete = "ds",
            replace = "cs",
            find = "",
            find_left = "",
            highlight = "",
            update_n_lines = "",
         },
      })
   end,
}
