vim.b.minisurround_config = {
   custom_surroundings = {
      -- Markdown link. Common usage:
      -- `ysiwl` + [type/paste link] + <CR> - add link
      -- `dsl` - delete link
      -- `csl` + [type/paste link] + <CR> - replace link
      l = {
         input = { "%[().-()%]%(.-%)" },
         output = function()
            local link = require("mini.surround").user_input("Link: ")
            return { left = "[", right = "](" .. link .. ")" }
         end,
      },
   },
}
