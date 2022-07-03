return {
	settings = {
		Lua = {
			format = {
				enable = true,
				defaultConfig = {
					indent_style = "tab",
					tab_size = "4",
					quote_style = "double",
					local_assign_continuation_align_to_first_expression = true,
					align_call_args = true,
					align_function_define_params = true,
					continuous_assign_statement_align_to_equal_sign = true,
					continuous_assign_table_field_align_to_equal_sign = true,
				},
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
