-- autopairs completions

Config.on_event("InsertEnter", function()
   vim.pack.add({ "https://github.com/windwp/nvim-autopairs" })

   require("nvim-autopairs").setup({
      enable_check_bracket_line = false,
   })
end)
