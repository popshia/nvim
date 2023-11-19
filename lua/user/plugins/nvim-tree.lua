local M = {
	"nvim-tree/nvim-tree.lua",
	event = "VeryLazy",
}

function M.config()
	-- disable netrw at the very start of your init.lua (strongly advised)
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1

	-- set termguicolors to enable highlight groups
	vim.opt.termguicolors = true

	require("nvim-tree").setup({
		sync_root_with_cwd = true,
		view = {
			width = 30,
		},
		renderer = {
			group_empty = true,
		},
		update_focused_file = {
			enable = true,
		},
		filters = {
			dotfiles = false,
		},
		on_attach = on_attach,
	})

	-- autocommands for open nvim tree when entering nvim in a directory
	local function open_nvim_tree(data)
		-- buffer is a [No Name]
		local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

		-- buffer is a directory
		local directory = vim.fn.isdirectory(data.file) == 1

		if not no_name and not directory then
			return
		end

		-- change to the directory
		if directory then
			vim.cmd.cd(data.file)
		end

		-- open the tree
		require("nvim-tree.api").tree.open()
	end

	vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

	-- automatically open file upon creation
	local api = require("nvim-tree.api")
	api.events.subscribe(api.events.Event.FileCreated, function(file)
		vim.cmd("edit " .. file.fname)
	end)
end

return M
