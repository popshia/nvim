local status_ok, outline = pcall(require, "symbols-outline")
if not status_ok then
	return
end

local icons = require("icons")

local opts = {
	highlight_hovered_item = true,
	show_guides = true,
	auto_preview = false,
	position = "right",
	relative_width = true,
	width = 25,
	auto_close = false,
	show_numbers = false,
	show_relative_numbers = false,
	show_symbol_details = true,
	preview_bg_highlight = "Pmenu",
	autofold_depth = nil,
	auto_unfold_hover = true,
	fold_markers = { "", "" },
	wrap = false,
	keymaps = {
		-- These keymaps can be a string or a table for multiple keys
		close = { "<Esc>", "q" },
		goto_location = "<Cr>",
		focus_location = "f",
		hover_symbol = "o",
		toggle_preview = "p",
		rename_symbol = "r",
		code_actions = "a",
		fold = "h",
		unfold = "l",
		fold_all = "W",
		unfold_all = "E",
		fold_reset = "R",
	},
	lsp_blacklist = {},
	symbol_blacklist = {},
	symbols = {
		File = { icon = icons.documents.File, hl = "TSURI" },
		Module = { icon = icons.kind.Module, hl = "TSNamespace" },
		Namespace = { icon = icons.kind.Namespace, hl = "TSNamespace" },
		Package = { icon = icons.ui.Package, hl = "TSNamespace" },
		Class = { icon = icons.kind.Class, hl = "TSType" },
		Method = { icon = icons.kind.Method, hl = "TSMethod" },
		Property = { icon = icons.kind.Property, hl = "TSMethod" },
		Field = { icon = icons.kind.Field, hl = "TSField" },
		Constructor = { icon = icons.kind.Constructor, hl = "TSConstructor" },
		Enum = { icon = icons.kind.Enum, hl = "TSType" },
		Interface = { icon = icons.kind.Interface, hl = "TSType" },
		Function = { icon = icons.kind.Function, hl = "TSFunction" },
		Variable = { icon = icons.kind.Variable, hl = "TSConstant" },
		Constant = { icon = icons.kind.Constant, hl = "TSConstant" },
		String = { icon = icons.type.String, hl = "TSString" },
		Number = { icon = icons.type.Number, hl = "TSNumber" },
		Boolean = { icon = icons.type.Boolean, hl = "TSBoolean" },
		Array = { icon = icons.type.Array, hl = "TSConstant" },
		Object = { icon = icons.type.Object, hl = "TSType" },
		Key = { icon = icons.ui.Lock, hl = "TSType" },
		Null = { icon = icons.type.NULL, hl = "TSType" },
		EnumMember = { icon = icons.kind.EnumMember, hl = "TSField" },
		Struct = { icon = icons.kind.Struct, hl = "TSType" },
		Event = { icon = icons.kind.Event, hl = "TSType" },
		Operator = { icon = icons.kind.Operator, hl = "TSOperator" },
		TypeParameter = { icon = icons.kind.TypeParameter, hl = "TSParameter" },
	},
}

outline.setup(opts)
