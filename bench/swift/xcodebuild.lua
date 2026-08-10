-- xcodebuild

on_filetype("swift", function()
   vim.pack.add({ gh("wojciech-kulik/xcodebuild.nvim"), gh("MunifTanjim/nui.nvim") })
   require("xcodebuild").setup({
      code_coverage = {
         enabled = true,
      },
   })
   map("n", "<leader>X", "<cmd>XcodebuildPicker<cr>", "Show all Xcodebuild actions")
   map("n", "<leader>xb", "<cmd>XcodebuildBuild<cr>", "Build Project")
   map("n", "<leader>xB", "<cmd>XcodebuildBuildForTesting<cr>", "Build Project For Testing")
   map("n", "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", "Build & Run Project")
   map("n", "<leader>xt", "<cmd>XcodebuildTest<cr>", "Run Tests")
   map("n", "<leader>xt", "<cmd>XcodebuildTestSelected<cr>", "Run Selected Tests")
   map("n", "<leader>xp", "<cmd>XcodebuildSelectTestPlan<cr>", "Select Test Plan")
   map("n", "<leader>xT", "<cmd>XcodebuildTestClass<cr>", "Run Current Test Class")
   map("n", "<leader>x.", "<cmd>XcodebuildRepeat<cr>", "Repeat Last Test Run")
   map("n", "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>", "Toggle Xcodebuild Logs")
   map("n", "<leader>xc", "<cmd>XcodebuildToggleCodeCoverage<cr>", "Toggle Code Coverage")
   map("n", "<leader>xC", "<cmd>XcodebuildShowCodeCoverageReport<cr>", "Show Code Coverage Report")
   map("n", "<leader>xe", "<cmd>XcodebuildTestExplorerToggle<cr>", "Toggle Test Explorer")
   map("n", "<leader>xs", "<cmd>XcodebuildFailingSnapshots<cr>", "Show Failing Snapshots")
   map("n", "<leader>xp", "<cmd>XcodebuildPreviewGenerateAndShow<cr>", "Generate Preview")
   map("n", "<leader>x<cr>", "<cmd>XcodebuildPreviewToggle<cr>", "Toggle Preview")
   map("n", "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>", "Select Device")
   map("n", "<leader>xx", "<cmd>XcodebuildQuickfixLine<cr>", "Quickfix Line")
   map("n", "<leader>xa", "<cmd>XcodebuildCodeActions<cr>", "Show Code Actions")
end)
