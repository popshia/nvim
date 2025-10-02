-- symbol outline

return {
   "oskarrrrrrr/symbols.nvim",
   lazy = true,
   keys = {
      { "<leader>so", "<cmd>SymbolsToggle<CR>", desc = "Symbol Outline" },
   },
   config = function()
      local r = require("symbols.recipes")
      require("symbols").setup(r.DefaultFilters, r.AsciiSymbols, {
         sidebar = {
            open_direction = "right",
            auto_peek = true,
            close_on_goto = true,
         },
      })
   end,
}
