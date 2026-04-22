-- statusline plugin

later(function()
   vim.pack.add({ gh("nvim-lualine/lualine.nvim") })

   local hide_in_width = function()
      return vim.fn.winwidth(0) > 80
   end

   local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn" },
      symbols = { error = " ", warn = " " },
      colored = true,
      update_in_insert = false,
      always_visible = false,
   }

   local diff = {
      "diff",
      colored = true,
      symbols = { added = "+", modified = "~", removed = "-" }, -- changes diff symbols
      cond = hide_in_width,
   }

   local filetype = {
      "filetype",
      icons_enabled = true,
   }

   local branch = {
      "branch",
      icons_enabled = true,
      icon = "",
   }

   local datetime = function()
      return os.date("%H:%M")
   end

   local session_status = {
      function()
         local status = require("sidekick.status").cli()
         return " " .. (#status > 1 and #status or "")
      end,
      cond = function()
         return #require("sidekick.status").cli() > 0
      end,
      color = function()
         return "Special"
      end,
   }

   local copilot_status = {
      function()
         return " "
      end,
      color = function()
         local status = require("sidekick.status").get()
         if status then
            return status.kind == "Error" and "DiagnosticError" or status.busy and "DiagnosticWarn" or "Special"
         end
      end,
      cond = function()
         local status = require("sidekick.status")
         return status.get() ~= nil
      end,
   }

   require("lualine").setup({
      options = {
         globalstatus = true,
         theme = "auto",
         section_separators = {},
         component_separators = { left = "|", right = "|" },
         disabled_filetypes = { "Outline", "ministarter" },
      },
      sections = {
         lualine_a = { "mode" },
         lualine_b = { branch, diff },
         lualine_c = { diagnostics },
         lualine_x = { filetype },
         lualine_y = { session_status, copilot_status },
         lualine_z = { datetime },
      },
      extensions = { "mason", "oil", "quickfix", "toggleterm" },
   })
end)
