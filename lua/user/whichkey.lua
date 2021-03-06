local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
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
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
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
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["a"] = { "<cmd>Alpha<cr>", "Alpha" },
	["e"] = { "<cmd>NvimTreeToggle<cr>", "File Explorer" },
	["r"] = { "<cmd>Jaq<cr>", "Run File" },
	["c"] = { "<cmd>lua require('Comment.api').call('toggle_current_linewise_op')<cr>g@$", "Comment" },

	b = {
		name = "Buffer",
		b = { "<cmd>BufferLinePick<cr>", "Pick Buffer" },
		d = { "<cmd>Bdelete!<cr>", "Close" },
	},

	f = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files<cr>", "Find files" },
		t = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find text" },
		r = { "<cmd>Telescope oldfiles<cr>", "Recent fils" },
		p = { "<cmd>Telescope projects<cr>", "Projects" },
		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
	},

	d = {
		name = "Debug",
		b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
		O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
		l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
		u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
		x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
	},

	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
	},

	h = {
		name = "Hop",
		w = { "<cmd>HopWord<cr>", "Word Mode" },
		l = { "<cmd>HopLine<cr>", "Line Mode" },
		L = { "<cmd>HopLineStart<cr>", "Line Start Mode" },
		c = { "<cmd>HopChar1<cr>", "1-char Mode" },
		C = { "<cmd>HopChar2<cr>", "2-char Mode" },
	},

	l = {
		name = "LSP",
		i = { "<cmd>LspInfo<cr>", "LSP Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = { "<cmd>lua vim.diagnostic.goto_next({ buffer=0 })<CR>", "Next Diagnostic" },
		k = { "<cmd>lua vim.diagnostic.goto_prev({ buffer=0 })<CR>", "Previous Diagnostic" },
		r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
		q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "QuickFix" },
		a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code actions" },
		s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
		-- f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format file" },
		-- t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition" },
		-- k = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover Doc" },
		-- d = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics" },
		-- w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
		-- S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
		-- s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
	},

	u = {
		name = "Utility",
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		p = {
			"<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
			"Colorscheme with preview",
		},
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
		r = { "<cmd>luafile %<cr>", "Reload luafile" },
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
	["/"] = { "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<cr>", "Comment" },
	["f"] = { "<esc><cmd>lua vim.lsp.buf.range_formatting()<cr>", "Format" },
	["h"] = { "<cmd>HopWord<cr>", "Hop" },
	["r"] = { "<esc><cmd>lua require'sniprun'.run('v')<cr>", "Run Code" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
