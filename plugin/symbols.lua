-- symbol outline

vim.pack.add({ "https://github.com/oskarrrrrrr/symbols.nvim" })

require("keymaps")

map("n", "<leader>so", "<cmd>SymbolsToggle<cr>", "Symbol Outline")

local r = require("symbols.recipes")

require("symbols").setup(r.DefaultFilters, r.AsciiSymbols, {
   sidebar = {
      open_direction = "right",
      auto_peek = true,
      close_on_goto = true,
   },
})
