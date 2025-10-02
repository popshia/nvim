return {
   "folke/sidekick.nvim",
   keys = {
      {
         "<tab>",
         function()
            -- if there is a next edit, jump to it, otherwise apply it if any
            if not require("sidekick").nes_jump_or_apply() then
               return "<Tab>" -- fallback to normal tab
            end
         end,
         expr = true,
         desc = "Goto/Apply Next Edit Suggestion",
      },
      {
         "<c-.>",
         function()
            require("sidekick.cli").focus()
         end,
         mode = { "n", "x", "i", "t" },
         desc = "Sidekick Switch Focus",
      },
      {
         "<leader>s.",
         function()
            require("sidekick.cli").toggle({ focus = true })
         end,
         desc = "Sidekick Toggle CLI",
         mode = { "n", "v" },
      },
      {
         "<leader>gm",
         function()
            require("sidekick.cli").toggle({ name = "gemini", focus = true })
         end,
         desc = "Sidekick Gemini Toggle",
         mode = { "n", "v" },
      },
      {
         "<leader>cp",
         function()
            require("sidekick.cli").toggle({ name = "copilot", focus = true })
         end,
         desc = "Sidekick Copilot Toggle",
         mode = { "n", "v" },
      },
      {
         "<leader>sp",
         function()
            require("sidekick.cli").prompt()
         end,
         desc = "Sidekick Ask Prompt",
         mode = { "n", "v" },
      },
      {
         "<leader>sv",
         function()
            require("sidekick.cli").send({ selection = true })
         end,
         mode = { "v" },
         desc = "Sidekick Send Visual Selection",
      },
   },
   opts = {},
}
