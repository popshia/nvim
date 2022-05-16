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
return packer.startup({
	function(use)
		-- Utility
		use("wbthomason/packer.nvim") -- have packer manage itself
		use("nvim-lua/plenary.nvim") -- useful lua functions used by lots of plugins
		use("nvim-lua/popup.nvim") -- vim popup api in neovim
		use("numToStr/Comment.nvim") -- easily comment stuff
		use("kyazdani42/nvim-web-devicons") -- file icons
		use("kyazdani42/nvim-tree.lua") -- nvim-tree file explorer
		use("akinsho/toggleterm.nvim") -- terminal integration
		use("ahmedkhalf/project.nvim") -- project file search
		use("lukas-reineke/indent-blankline.nvim") -- show tab and indents
		use("antoinemadec/FixCursorHold.nvim") -- this is needed to fix lsp doc highlight
		use("famiu/bufdelete.nvim") -- better buffer manipulation
		use("declancm/cinnamon.nvim") -- smooth scroll
		use("lewis6991/impatient.nvim") -- improve startup speed
		use("phaazon/hop.nvim") -- hop to any word you like
		use("rcarriga/nvim-notify") -- vim notify
		use("ZhiyuanLck/smart-pairs") -- autopairs, integrates with both cmp and treesitter
		-- use("kevinhwang91/nvim-hlslens") -- search with count

		-- Interface
		use("folke/which-key.nvim") -- show available keys after hitting space
		use("goolord/alpha-nvim") -- startup page
		use("nvim-lualine/lualine.nvim") -- status line
		use({ "akinsho/bufferline.nvim", tag = "*" }) -- buffer tab line
		use("SmiteshP/nvim-gps") -- status line components

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
		use("lukas-reineke/cmp-under-comparator") -- sort completions
		use("kevinhwang91/nvim-hlslens") -- searching plugin
		use({ "tzachar/cmp-tabnine", run = "./install.sh" }) -- tabnine completions
		use({
			"zbirenbaum/copilot.lua",
			event = { "VimEnter" },
			config = function()
				vim.defer_fn(function()
					require("copilot").setup()
				end, 100)
			end,
		})
		use({
			"zbirenbaum/copilot-cmp",
			after = { "copilot.lua", "nvim-cmp" },
		})
		-- use("github/copilot.vim") -- github copilot

		-- Snippets
		use("L3MON4D3/LuaSnip") --snippet engine
		use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

		-- LSP
		use("neovim/nvim-lspconfig") -- enable LSP
		use("williamboman/nvim-lsp-installer") -- simple to use language server installer
		use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
		use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
		use("RRethy/vim-illuminate") -- automatically highlighting other uses of the current word under the cursor

		-- Telescope
		use("nvim-telescope/telescope.nvim") -- highly extendable fuzzy finder over lists

		-- Treesitter
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- treesitter for syntax highlighting
		use("nvim-treesitter/nvim-treesitter-context") -- show treesitter context
		use("JoosepAlviste/nvim-ts-context-commentstring") -- set comments based on file type

		-- Git
		use("lewis6991/gitsigns.nvim") -- git integration

		-- Code runners
		use("is0n/jaq-nvim") -- code runner
		use({ "michaelb/sniprun", run = "bash ./install.sh" }) -- run code within a range

		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if PACKER_BOOTSTRAP then
			require("packer").sync()
		end
	end,
	config = {
		-- Move to lua dir so impatient.nvim can cache it
		compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
	},
})
