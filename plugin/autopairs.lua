-- autopairs completions

on_event("InsertEnter", function()
   vim.pack.add({ gh("windwp/nvim-autopairs") })

   require("nvim-autopairs").setup({
      enable_check_bracket_line = false,
   })
end)
