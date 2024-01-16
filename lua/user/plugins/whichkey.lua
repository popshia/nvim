-- keybinding menus when typing leader key

local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
}

function M.config()
	local setup = {
		plugins = {
			marks = false, -- shows a list of your marks on ' and `
			registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
			spelling = {
				enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
				suggestions = 20, -- how many suggestions should be shown in the list?
			},
			-- the presets plugin, adds help for a bunch of default keybindings in Neovim
			-- No actual key bindings are created
			presets = {
				operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
				motions = true, -- adds help for motions
				text_objects = true, -- help for text objects triggered after entering an operator
				windows = true, -- default bindings on <c-w>
				nav = true, -- misc bindings to work with windows
				z = false, -- bindings for folds, spelling and others prefixed with z
				g = false, -- bindings for prefixed with g
			},
		},
		-- add operators that will trigger motion and text object completion
		-- to enable all native operators, set the preset / operators plugin above
		-- operators = { gc = "Comments" },
		key_labels = {
			-- override the label used to display some keys. It doesn't effect WK in any other way.
			-- For example:
			-- ["<space>"] = "SPC",
			-- ["<cr>"] = "RET",
			-- ["<tab>"] = "TAB",
		},
		icons = {
			breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
			separator = "➜", -- symbol used between a key and it's label
			group = "+", -- symbol prepended to a group
		},
		popup_mappings = {
			scroll_down = "<c-d>", -- binding to scroll down inside the popup
			scroll_up = "<c-u>", -- binding to scroll up inside the popup
		},
		window = {
			border = "rounded", -- none, single, double, shadow
			position = "bottom", -- bottom, top
			margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
			padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
			winblend = 0,
		},
		layout = {
			height = { min = 4, max = 25 }, -- min and max height of the columns
			width = { min = 20, max = 50 }, -- min and max width of the columns
			spacing = 10, -- spacing between columns
			align = "center", -- align columns left, center or right
		},
		ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
		hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
		show_help = true, -- show help message on the command line when the popup is visible
		triggers = "auto", -- automatically setup triggers
		-- triggers = { "<leader>" }, -- or specify a list manually
		triggers_blacklist = {
			-- list of mode / prefixes that should never be hooked by WhichKey
			-- this is mostly relevant for key maps that start with a native binding
			-- most people should not need to change this
			i = { "j", "k" },
			v = { "j", "k" },
		},
	}

	local opts = {
		mode = "n", -- normal mode
		prefix = "<leader>",
		buffer = nil, -- global mappings. specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	}

	local mappings = {
		["a"] = { "<cmd>Alpha<cr>", "Alpha" },
		["e"] = { ":lua require('oil').toggle_float()<cr>", "Oil" },
		b = {
			name = "Buffer",
			b = { "<cmd>BufferLinePick<cr>", "Pick Buffer" },
			d = { ":lua require('bufdelete').bufdelete(0, false)<cr>", "Close Buffer" },
		},
		-- c = {
		-- 	name = "Leetcode",
		-- 	d = { "<cmd>LBQuestion<cr>", "Question Description" },
		-- 	l = { "<cmd>LBQuestions<cr>", "List Questions" },
		-- 	r = { "<cmd>LBReset<cr>", "Reset Question" },
		-- 	t = { "<cmd>LBTest<cr>", "Test Code" },
		-- 	s = { "<cmd>LBSubmit<cr>", "Submit Code" },
		-- 	c = { "<cmd>LBChangeLanguage<cr>", "Change Language" },
		-- },
		f = {
			name = "Telescope",
			f = { "<cmd>Telescope find_files<cr>", "Find Files" },
			t = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
			r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
			p = { "<cmd>Telescope projects<cr>", "Projects" },
			b = { "<cmd>Telescope buffers<cr>", "Buffers" },
			k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
			c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
			h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		},
		g = {
			name = "Git",
			g = { "<cmd>Neogit<cr>", "Neogit" },
			n = { "<cmd>Gitsigns next_hunk<cr>", "Next Hunk" },
			p = { "<cmd>Gitsigns prev_hunk<cr>", "Prev Hunk" },
			b = { "<cmd>Gitsigns blame_line<cr>", "Blame" },
			h = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
			r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
			R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer" },
			s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
			u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo Stage Hunk" },
			o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
			B = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
			d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
		},
		l = {
			name = "LSP",
			m = { "<cmd>Mason<cr>", "Mason" },
			i = { "<cmd>LspInfo<cr>", "LSP Info" },
			f = { "<cmd>lua vim.lsp.buf.format({ async = false })<cr>", "Format" },
			s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document symbols" },
			S = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
			-- j = { "<cmd>lua vim.diagnostic.goto_next({ buffer=0 })<CR>", "Next Diagnostic" },
			-- k = { "<cmd>lua vim.diagnostic.goto_prev({ buffer=0 })<CR>", "Previous Diagnostic" },
		},
		p = {
			name = "Lazy",
			i = { "<cmd>Lazy show<cr>", "Info" },
			s = { "<cmd>Lazy sync<cr>", "Sync" },
			l = { "<cmd>Lazy log<cr>", "Log" },
			p = { "<cmd>Lazy profile<cr>", "Profile" },
			u = { "<cmd>Lazy update<cr>", "Update" },
			c = { "<cmd>Lazy clean<cr>", "Clean" },
		},
		t = {
			name = "Trouble",
			t = { "<cmd>TroubleToggle<cr>", "Toggle" },
			l = { "<cmd>TroubleToggle loclist<cr>", "Loclist" },
			q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
			r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
			d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
			w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
		},
	}

	local vopts = {
		mode = "v",
		prefix = "<leader>",
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = true,
	}

	local vmappings = {
		["f"] = { "<esc><cmd>lua vim.lsp.buf.range_formatting()<cr>", "Format" },
	}

	require("which-key").setup(setup)
	require("which-key").register(mappings, opts)
	require("which-key").register(vmappings, vopts)
end

return M
