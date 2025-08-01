-- xcodebuild

return {
   "wojciech-kulik/xcodebuild.nvim",
   dependencies = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
      "folke/snacks.nvim", -- (optional) to show previews
      "stevearc/oil.nvim", -- (optional) to manage project files
      "nvim-treesitter/nvim-treesitter", -- (optional) for Quick tests support (required Swift parser)
   },
   keys = {
      { "<leader>X", "<cmd>XcodebuildPicker<cr>", desc = "Show All Xcoddbuild Actions" },
      { "<leader>xb", "<cmd>XcodebuildBuild<cr>", desc = "Build Project" },
      { "<leader>xB", "<cmd>XcodebuildBuildForTesting<cr>", desc = "Build Project For Testing" },
      { "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", desc = "Build & Run Project" },
      { "<leader>xt", "<cmd>XcodebuildTest<cr>", mode = { "n" }, desc = "Run Tests" },
      { "<leader>xt", "<cmd>XcodebuildTestSelected<cr>", mode = { "v" }, desc = "Run Selected Tests" },
      { "<leader>xp", "<cmd>XcodebuildSelectTestPlan<cr>", desc = "Select Test Plan" },
      { "<leader>xT", "<cmd>XcodebuildTestClass<cr>", desc = "Run Current Test Class" },
      { "<leader>x.", "<cmd>XcodebuildRepeat<cr>", desc = "Repeat Last Test Run" },
      { "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>", desc = "Toggle Xcodebuild Logs" },
      { "<leader>xc", "<cmd>XcodebuildToggleCodeCoverage<cr>", desc = "Toggle Code Coverage" },
      { "<leader>xC", "<cmd>XcodebuildShowCodeCoverageReport<cr>", desc = "Show Code Coverage Report" },
      { "<leader>xe", "<cmd>XcodebuildTestExplorerToggle<cr>", desc = "Toggle Test Explorer" },
      { "<leader>xs", "<cmd>XcodebuildFailingSnapshots<cr>", desc = "Show Failing Snapshots" },
      { "<leader>xp", "<cmd>XcodebuildPreviewGenerateAndShow<cr>", desc = "Generate Preview" },
      { "<leader>x<cr>", "<cmd>XcodebuildPreviewToggle<cr>", desc = "Toggle Preview" },
      { "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>", desc = "Select Device" },
      { "<leader>xx", "<cmd>XcodebuildQuickfixLine<cr>", desc = "Quickfix Line" },
      { "<leader>xa", "<cmd>XcodebuildCodeActions<cr>", desc = "Show Code Actions" },
   },
   config = function()
      require("xcodebuild").setup({
         code_coverage = {
            enabled = true,
         },
      })
   end,
}
