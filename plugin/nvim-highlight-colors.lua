-- colorize color codes

later(function()
   vim.pack.add({ gh("brenoprata10/nvim-highlight-colors") })

   require("nvim-highlight-colors").setup({
      -- background | foreground | virtual
      render = "virtual",
      virtual_symbol = "󱓻",
      virtual_symbol_suffix = " ",
      enable_tailwind = true,
      exclude_filetypes = { "lazy" },
   })
end)
