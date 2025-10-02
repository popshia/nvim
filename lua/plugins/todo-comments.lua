-- highlight todo comments

return {
   "folke/todo-comments.nvim",
   event = {
      "BufReadPre",
      "BufNewFile",
   },
   opts = {
      signs = true,
      keywords = {
         -- TODO: this is a todo.
         TODO = { icon = "", color = "#E9B143" },
         -- REVIEW: review this line.
         REVIEW = { icon = "", color = "#B0B846" },
         -- FIXME: fix me plz.
         FIXME = { icon = "", color = "#F2594B" },
         -- NOTE: a note for myself.
         NOTE = { icon = "󰎚", color = "#80AA9E" },
         -- TEST: testing info.
         TEST = { icon = "󰋼", color = "#D3869B" },
      },
      gui_style = {
         fg = "BOLD", -- The gui style to use for the fg highlight group.
         bg = "BOLD", -- The gui style to use for the bg highlight group.
      },
      highlight = {
         before = "", -- "fg" or "bg" or empty
         keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
         after = "fg", -- "fg" or "bg" or empty
      },
   },
}
