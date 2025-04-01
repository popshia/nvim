-- undo tree

return {
   "jiaoshijie/undotree",
   dependencies = "nvim-lua/plenary.nvim",
   keys = {
      { "<leader>u", function() require("undotree").toggle() end, desc = "Undotree" },
   },
   opts = {},
}
