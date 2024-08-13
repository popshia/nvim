-- tailwind-tools.lua

return {
	"luckasRanarison/tailwind-tools.nvim",
	name = "tailwind-tools",
	build = ":UpdateRemotePlugins",
	opts = {
		document_color = {
			enabled = false,
		},
		conceal = {
			enabled = false,
		},
	},
}
