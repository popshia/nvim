-- inline diagnostics

-- test area
-- print(warning)
-- local hint = 0
-- function test(a, b, c)
--    print(a, bad, b+f, c
-- end
-- error
-- info = "hello"

return {
   "rachartier/tiny-inline-diagnostic.nvim",
   event = {
      "BufReadPre",
      "BufNewFile",
   },
   priority = 1000,
   opts = {
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
   },
}
