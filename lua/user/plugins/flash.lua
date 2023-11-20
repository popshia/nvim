local M = {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	-- stylua: ignore
	keys = {
		{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,   desc = "Flash" },
		-- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
		{ "r", mode = "o",               function() require("flash").remote() end, desc = "Remote Flash" },
		-- { "R", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
	},
}

function M.config()
	require("flash").setup({
		jump = {
			nohlsearch = true,
			autojump = true,
		},
	})
end

return M
