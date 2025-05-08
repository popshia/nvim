-- colorful completion menu

return {
   "xzbdmw/colorful-menu.nvim",
   opts = {
      ls = {
         lua_ls = {
            -- Maybe you want to dim arguments a bit.
            arguments_hl = "@comment",
         },
         ts_ls = {
            -- false means do not include any extra info,
            -- see https://github.com/xzbdmw/colorful-menu.nvim/issues/42
            extra_info_hl = "@comment",
         },
         clangd = {
            -- Such as "From <stdio.h>".
            extra_info_hl = "@comment",
            -- Similar to the same setting of gopls.
            align_type_to_right = true,
            -- the hl group of leading dot of "•std::filesystem::permissions(..)"
            import_dot_hl = "@comment",
            -- See https://github.com/xzbdmw/colorful-menu.nvim/pull/36
            preserve_type_when_truncate = true,
         },
         basedpyright = {
            -- It is usually import path such as "os"
            extra_info_hl = "@comment",
         },
      },
   },
}
