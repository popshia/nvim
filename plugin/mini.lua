-- mini.nvim plugins

now(function()
   -- Start screen
   local starter = require("mini.starter")
   starter.setup({
      header = function()
         local hour = tonumber(vim.fn.strftime("%H"))
         local part_id = math.floor((hour + 4) / 8) + 1
         local day_part = ({ "evening", "morning", "afternoon", "evening" })[part_id]
         return ("Good %s, Noah!"):format(day_part)
      end,
      items = {
         starter.sections.recent_files(5, false, false),
         { action = ":lua Snacks.picker.grep()", name = "text", section = "find" },
         { action = ":lua Snacks.picker.smart()", name = "files", section = "find" },
         {
            action = ':lua Snacks.picker.projects({dev={"~/Developer"}})',
            name = "project",
            section = "find",
         },
         { action = ":lua Snacks.lazygit()", name = "lazygit", section = "actions" },
         { action = ":lua vim.pack.update()", name = "update plugins", section = "actions" },
         { action = "qall", name = "quit", section = "actions" },
      },
      footer = "stay hungry, stay foolish.",
      silent = true,
   })
end)

later(function()
   -- Around/Inside textobjects
   require("mini.ai").setup({
      silent = true,
   })

   -- Autopairs
   require("mini.pairs").setup()

   -- Split/Join arguments
   require("mini.splitjoin").setup({
      mappings = {
         toggle = "<leader>sj",
      },
   })

   -- Surround
   require("mini.surround").setup({
      mappings = {
         add = "ys",
         delete = "ds",
         replace = "cs",
         find = "",
         find_left = "",
         highlight = "",
         update_n_lines = "",
      },
   })

   -- Icons
   require("mini.icons").setup()
   MiniIcons.mock_nvim_web_devicons()

   -- Cursorword
   require("mini.cursorword").setup()
   vim.api.nvim_set_hl(0, "MiniCursorword", { underline = true })
   vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", { link = "MiniCursorword" })

   -- Align
   require("mini.align").setup({
      mappings = {
         start = "<leader>a",
         start_with_preview = "<leader>A",
      },
   })
end)
