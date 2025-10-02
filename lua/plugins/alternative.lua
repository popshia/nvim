-- Quickly edit code using predefined rules

return {
   "Goose97/alternative.nvim",
   version = "main", -- Use for stability; omit to use `main` branch for the latest features
   event = "VeryLazy",
   opts = {
      rules = {
         -- Built-in rules
         "general.boolean_flip",
         "general.number_increment_decrement",
         "general.compare_operator_flip",
      },
   },
}
