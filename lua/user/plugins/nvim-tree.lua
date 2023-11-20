local M = {
	"nvim-tree/nvim-tree.lua",
	-- event = "VeryLazy",
}

function M.config()
	-- disable netrw at the very start of your init.lua (strongly advised)
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1

	-- set termguicolors to enable highlight groups
	vim.opt.termguicolors = true

	local icons = require("user.utils.icons")

	require("nvim-tree").setup({
		sync_root_with_cwd = true,
		hijack_netrw = true,
		view = {
			width = 30,
			relativenumber = false,
		},
		renderer = {
			group_empty = true,
			icons = {
				git_placement = "before",
				padding = " ",
				symlink_arrow = " ➛ ",
				glyphs = {
					default = icons.ui.Text,
					symlink = icons.ui.FileSymlink,
					bookmark = icons.ui.BookMark,
					folder = {
						arrow_closed = icons.ui.ChevronRight,
						arrow_open = icons.ui.ChevronShortDown,
						default = icons.ui.Folder,
						open = icons.ui.FolderOpen,
						empty = icons.ui.EmptyFolder,
						empty_open = icons.ui.EmptyFolderOpen,
						symlink = icons.ui.FolderSymlink,
						symlink_open = icons.ui.FolderOpen,
					},
					git = {
						unstaged = icons.git.FileUnstaged,
						staged = icons.git.FileStaged,
						unmerged = icons.git.FileUnmerged,
						renamed = icons.git.FileRenamed,
						untracked = icons.git.FileUntracked,
						deleted = icons.git.FileDeleted,
						ignored = icons.git.FileIgnored,
					},
				},
			},
		},
		update_focused_file = {
			enable = true,
			debounce_delay = 15,
			update_root = true,
			ignore_list = {},
		},
		filters = {
			dotfiles = false,
		},
	})

	-- autocommands for open nvim tree when entering nvim in a directory
	local function open_nvim_tree(data)
		-- buffer is a directory
		local directory = vim.fn.isdirectory(data.file) == 1

		if not directory then
			return
		end

		-- change to the directory
		vim.cmd.cd(data.file)

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
