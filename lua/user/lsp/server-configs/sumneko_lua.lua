return {
	settings = {
		Lua = {
			format = {
				enable = true,
				defaultConfig = {
					indent_style = "tab",
					tab_size = "4",
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
