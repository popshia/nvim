local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Utility
	use("wbthomason/packer.nvim") -- have packer manage itself
	use("nvim-lua/plenary.nvim") -- useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- easily comment stuff
	use("kyazdani42/nvim-web-devicons") -- file icons
	use("kyazdani42/nvim-tree.lua") -- nvim-tree file explorer
	use("akinsho/toggleterm.nvim") -- terminal integration
	use("ahmedkhalf/project.nvim") -- project file search
	use("lukas-reineke/indent-blankline.nvim") -- show tab and indents
	use("antoinemadec/FixCursorHold.nvim") -- this is needed to fix lsp doc highlight
	use("kevinhwang91/nvim-hlslens") -- search with count
	use({
		"phaazon/hop.nvim",
		branch = "v1", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})

	-- Interface
	use("folke/which-key.nvim") -- show available keys after hitting space
	use("goolord/alpha-nvim") -- startup page
	use("nvim-lualine/lualine.nvim") -- status line
	use("akinsho/bufferline.nvim") -- buffer tab line

	-- Colorschemes
	use("RRethy/nvim-base16") -- neovim base16 colorschemes
	use("olimorris/onedarkpro.nvim") -- one dark pro
	use("sainnhe/gruvbox-material") -- gruvbox

	-- Completion
	use("hrsh7th/nvim-cmp") -- the completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp") -- lsp completions

	-- Snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	-- Telescope
	use("nvim-telescope/telescope.nvim") -- highly extendable fuzzy finder over lists

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter", -- treesitter for syntax highlighting
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring") -- set comments based on file type

	-- Git
	use("lewis6991/gitsigns.nvim") -- git integration

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
