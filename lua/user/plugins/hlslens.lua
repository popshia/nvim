-- show search count using "/"

return {
	"kevinhwang91/nvim-hlslens",
	keys = {
		{ "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR>zz<Cmd>lua require('hlslens').start()<CR>]] },
		{ "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR>zz<Cmd>lua require('hlslens').start()<CR>]] },
		{ "*", [[*zz<Cmd>lua require('hlslens').start()<CR>]] },
		{ "#", [[#zz<Cmd>lua require('hlslens').start()<CR>]] },
		{ "g*", [[g*zz<Cmd>lua require('hlslens').start()<CR>]] },
		{ "g#", [[g#zz<Cmd>lua require('hlslens').start()<CR>]] },
	},
	opts = {
		calm_down = true,
		nearest_only = true,
		nearest_float_when = "auto",
	},
}
