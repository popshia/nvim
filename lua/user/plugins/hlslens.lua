-- show search count using "/"

local M = {
	"kevinhwang91/nvim-hlslens",
	keys = {
		{ "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR>zz<Cmd>lua require('hlslens').start()<CR>]] },
		{ "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR>zz<Cmd>lua require('hlslens').start()<CR>]] },
		{ "*", [[*zz<Cmd>lua require('hlslens').start()<CR>]] },
		{ "#", [[#zz<Cmd>lua require('hlslens').start()<CR>]] },
		{ "g*", [[g*zz<Cmd>lua require('hlslens').start()<CR>]] },
		{ "g#", [[g#zz<Cmd>lua require('hlslens').start()<CR>]] },
	},
}

function M.config()
	require("hlslens").setup({
		calm_down = true,
		nearest_only = true,
		nearest_float_when = "auto",
	})
end

return M
