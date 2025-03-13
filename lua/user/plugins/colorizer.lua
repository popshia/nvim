-- colorize color codes

return {
   "brenoprata10/nvim-highlight-colors",
   event = {
      "BufReadPre",
      "BufNewFile",
   },
   opts = {
      -- background | foreground | virtual
      render = "virtual",
      virtual_symbol = "󱓻",
      virtual_symbol_suffix = " ",
      enable_tailwind = true,
      exclude_filetypes = { "lazy" },
   },
}
