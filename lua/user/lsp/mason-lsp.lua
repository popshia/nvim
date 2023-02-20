local status_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

mason_lsp.setup_handlers {
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup {}
	end,
	-- Next, you can provide a dedicated handler for specific servers.
	-- For example, a handler override for the `rust_analyzer`:
	-- ["rust_analyzer"] = function ()
	-- 	require("rust-tools").setup {}
	-- end
}

-- mason_lsp.setup({
-- 	ensure_installed = { "pyright", "lua_ls", "clangd" },
-- })
--
-- local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
-- if not lspconfig_status_ok then
-- 	return
-- end
--
-- local servers = {
-- 	"pyright",
-- 	"lua_ls",
-- 	"clangd",
-- 	"texlab"
-- }
--
-- local opts = {}
--
-- for _, server in pairs(servers) do
-- 	opts = {
-- 		on_attach = require("user.lsp.handlers").on_attach,
-- 		capabilities = require("user.lsp.handlers").capabilities,
-- 	}
--
-- 	if server == "lua_ls" then
-- 		local lua_ls_opts = require("user.lsp.server-configs.lua_ls")
-- 		opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
-- 	end
--
-- 	if server == "pyright" then
-- 		local pyright_opts = require("user.lsp.server-configs.pyright")
-- 		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
-- 	end
--
-- 	lspconfig[server].setup(opts)
-- end
