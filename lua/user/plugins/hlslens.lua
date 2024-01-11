-- show search count using "/"

local M = {
	"kevinhwang91/nvim-hlslens",
}

function M.config()
	require("hlslens").setup({
		calm_down = true,
		nearest_only = true,
		nearest_float_when = "auto",
	})

	local map = function(mode, keys, func)
		vim.keymap.set(mode, keys, func, { noremap = true, silent = true })
	end

	map("n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR>zz<Cmd>lua require('hlslens').start()<CR>]])
	map("n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR>zz<Cmd>lua require('hlslens').start()<CR>]])
	map("n", "*", [[*zz<Cmd>lua require('hlslens').start()<CR>]])
	map("n", "#", [[#zz<Cmd>lua require('hlslens').start()<CR>]])
	map("n", "g*", [[g*zz<Cmd>lua require('hlslens').start()<CR>]])
	map("n", "g#", [[g#zz<Cmd>lua require('hlslens').start()<CR>]])
end

return M
