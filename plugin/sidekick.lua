-- ai companion

now_if_args(function()
   vim.pack.add({ gh("folke/sidekick.nvim") })

   map("n", "<tab>", function()
      -- if there is a next edit, jump to it, otherwise apply it if any
      if not require("sidekick").nes_jump_or_apply() then
         return "<Tab>" -- fallback to normal tab
      end
   end, "Goto/Apply Next Edit Suggestion", true)
   map({ "n", "x", "i", "t" }, "<c-.>", function()
      require("sidekick.cli").focus()
   end, "Sidekick Switch Focus")
   map({ "n", "v" }, "<leader>s.", function()
      require("sidekick.cli").toggle({ focus = true })
   end, "Sidekick Toggle CLI")
   map({ "n", "v" }, "<leader>gm", function()
      require("sidekick.cli").toggle({ name = "gemini", focus = true })
   end, "Sidekick Gemini Toggle")
   map({ "n", "v" }, "<leader>cp", function()
      require("sidekick.cli").toggle({ name = "copilot", focus = true })
   end, "Sidekick Copilot Toggle")
   map({ "n", "v" }, "<leader>sp", function()
      require("sidekick.cli").prompt()
   end, "Sidekick Ask Prompt")
   map("v", "<leader>sv", function()
      require("sidekick.cli").send({ selection = true })
   end, "Sidekick Send Visual Selection")

   require("sidekick").setup()
end)
