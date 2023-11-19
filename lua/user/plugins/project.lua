local M = {
	"ahmedkhalf/project.nvim",
	event = "VeryLazy",
}

function M.config()
	require("project_nvim").setup({
		-- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
		detection_methods = { "pattern" },
		---@usage patterns used to detect root dir, when **"pattern"** is in detection_methods
		patterns = { ".git", "Makefile", "package.json" },
	})

	require("telescope").load_extension("projects")
end

return M
