-- symbol outline

vim.pack.add({ "https://github.com/oskarrrrrrr/symbols.nvim" })

vim.api.nvim_create_autocmd("LspAttach", {
   once = true,
   callback = function()
      -- keymaps
      require("keymaps")

      map("n", "<leader>so", "<cmd>SymbolsToggle<cr>", "Symbol Outline")

      -- setup
      local r = require("symbols.recipes")

      require("symbols").setup(r.DefaultFilters, r.AsciiSymbols, {
         sidebar = {
            open_direction = "right",
            auto_peek = true,
            close_on_goto = true,
         },
      })
   end,
})
