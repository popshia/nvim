-- inline diagnostics

-- test area
-- print(warning)
-- local hint = 0
-- function test(a, b, c)
--    print(a, bad, b+f, c
-- end
-- error
-- info = "hello"

Config.later(function()
   vim.pack.add({ "https://github.com/rachartier/tiny-inline-diagnostic.nvim" })

   Config.on_event("LspAttach", function()
      require("tiny-inline-diagnostic").setup({
         preset = "classic", -- modern, classic, minimal, simple, nonerdfont, powerline
         transparent_bg = true,
         options = {
            multilines = {
               -- Enable multiline diagnostic messages
               enabled = true,
               -- Always show messages on all lines for multiline diagnostics
               always_show = false,
            },
         },
      })
   end)
end)
