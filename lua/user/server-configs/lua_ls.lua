return {
	settings = {
		Lua = {
			-- format = {
			-- 	enable = false,
			-- 	defaultConfig = {
			-- 		indent_style = "tab",
			-- 		tab_size = "4",
			-- 		quote_style = "double",
			-- 		call_arg_parenthesis = "keep",
			-- 		local_assign_continuation_align_to_first_expression = true,
			-- 		align_call_args = true,
			-- 		align_function_define_params = true,
			-- 		keep_one_space_between_table_and_bracket = true,
			-- 		align_table_field_to_first_field = true,
			-- 		keep_one_space_between_namedef_and_attribute = true,
			-- 		continuous_assign_statement_align_to_equal_sign = true,
			-- 		continuous_assign_table_field_align_to_equal_sign = true,
			-- 	},
			-- },
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
