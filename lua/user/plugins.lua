local fn = vim.fn

-- Install Packer
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

-- Automatically reload neovim when plugin.lua is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Escaping errors in case packer is not installed
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Open Packer in a Pop-Up Window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Your plugins installed here
return packer.startup(function(use)
	-- Packer itself
	use("wbthomason/packer.nvim") -- Have packer manage itself

	-- Other Plugins
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("kyazdani42/nvim-web-devicons") -- Icons for nvim
	use("kyazdani42/nvim-tree.lua") -- File Explorer
	use("akinsho/bufferline.nvim") -- Top Tabs to easily navigate through open tabs
	use("moll/vim-bbye") --
	use("nvim-lualine/lualine.nvim") -- Bottom line (with diagnostics, branch,...)
	use("akinsho/toggleterm.nvim") -- Terminal plugin
	use("ahmedkhalf/project.nvim") -- Project management
	use("lewis6991/impatient.nvim") -- Load plugins faster
	use("lukas-reineke/indent-blankline.nvim") -- Indentation lines
	use("glepnir/dashboard-nvim") -- Dashboard
	use("rcarriga/nvim-notify") -- Notifications
	use("petertriho/nvim-scrollbar")
	use("kevinhwang91/nvim-hlslens")
	use("j-hui/fidget.nvim")
	use({ "quick-lint/quick-lint-js", rtp = "plugin/vim/quick-lint-js.vim", tag = "2.10.0", opt = true })

	-- Colorschemes
	use("lunarvim/darkplus.nvim")
	use("kadekillary/skull-vim")
	use("projekt0n/github-nvim-theme")
	use("tiagovla/tokyodark.nvim")
	use("folke/tokyonight.nvim")
	use("navarasu/onedark.nvim")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/vim-vsnip-integ")
	use("Shougo/deoplete.nvim")
	use("roxma/nvim-yarp")
	use("roxma/vim-hug-neovim-rpc")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
	use("dcampos/nvim-snippy")
	use("honza/vim-snippets")
	use("dcampos/cmp-snippy")

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/mason.nvim") -- simple to use language server installer
	use("williamboman/mason-lspconfig.nvim") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- LSP diagnostics and code actions
	use("MunifTanjim/prettier.nvim") -- Prettier for JS, HTML & CSS

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Clang_extensions
	use("p00f/clangd_extensions.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
