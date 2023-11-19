local M = {
	"phaazon/hop.nvim",
	event = "InsertEnter",
}

function M.config()
	require("hop").setup({
		keys = "etovxqpdygfblzhckisuran",
	})
end

return M
