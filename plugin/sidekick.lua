-- ai companion

now_if_args(function()
   vim.pack.add({ gh("folke/sidekick.nvim") })

   map("n", "<tab>", function()
      if not require("sidekick").nes_jump_or_apply() then
         return "<Tab>"
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
   map({ "n", "v" }, "<leader>sp", function()
      require("sidekick.cli").prompt()
   end, "Sidekick Ask Prompt")
   map({ "n", "x" }, "<leader>sv", function()
      require("sidekick.cli").send({ msg = "{this}" })
   end, "Sidekick Send Visual Selection")

   require("sidekick").setup()

   local disabled = false
   new_autocmd("User", "SidekickNesHide", false, function()
      if disabled then
         disabled = false
         require("tiny-inline-diagnostic").enable()
      end
   end, "SidekickNesHide")
   new_autocmd("User", "SidekickNesShow", false, function()
      disabled = true
      require("tiny-inline-diagnostic").disable()
   end, "SidekickNesShow")
end)
