-- improve vim skils

return {
   "m4xshen/hardtime.nvim",
   dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
   },
   config = function()
      require("hardtime").setup({
         disable_mouse = false,
         max_count = 10,
         allow_different_key = true,
         hints = {
            ["[dcyvV][ia][%(%)]"] = {
               message = function(keys)
                  return "Use " .. keys:sub(1, 2) .. "b instead of " .. keys
               end,
               length = 3,
            },
            ["[dcyvV][ia][%{%}]"] = {
               message = function(keys)
                  return "Use " .. keys:sub(1, 2) .. "B instead of " .. keys
               end,
               length = 3,
            },
            ["[dcyvV][ia][%'%']"] = {
               message = function(keys)
                  return "Use " .. keys:sub(1, 2) .. "q instead of " .. keys
               end,
               length = 3,
            },
            ['[dcyvV][ia][%"%"]'] = {
               message = function(keys)
                  return "Use " .. keys:sub(1, 2) .. "q instead of " .. keys
               end,
               length = 3,
            },
         },
      })
   end,
}
