-- symbol outline

return {
   "hedyhli/outline.nvim",
   lazy = true,
   cmd = { "Outline", "OutlineOpen" },
   keys = { -- Example mapping to toggle outline
      { "<leader>so", "<cmd>Outline<CR>", desc = "Symbol Outline" },
   },
   opts = {
      outline_window = {
         auto_close = true,
         show_cursorline = true,
         hide_cursor = true,
      },
      keymaps = {
         hover_symbol = "H",
      },
      preview_window = {
         live = true,
      },
   },
}
