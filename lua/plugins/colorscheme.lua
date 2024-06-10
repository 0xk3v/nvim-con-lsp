return {
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = {
			style = "night",
		},
	},
	{ "rose-pine/neovim", name = "rose-pine" },
	-- { "marko-cerovac/material.nvim" },
	-- { "EdenEast/nightfox.nvim" }, -- lazy
	-- {
	-- 	"0xk3v/lavend3r",
	-- },
	-- {
	-- 	"LazyVim/LazyVim",
	-- 	opts = {
	-- 		colorscheme = "rose-pine",
	-- 	},
	-- },
	{
		dir = "/home/kev/projects/skull.nvim",
	},
	{
		dir = "/home/kev/projects/lavend3r",
	},
	-- {
	-- 	"tiagovla/tokyodark.nvim",
	-- 	opts = {
	-- 		-- custom options here
	-- 		transparent_background = true,
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("tokyodark").setup(opts) -- calling setup is optional
	-- 		vim.cmd([[colorscheme tokyodark]])
	-- 	end,
	-- },
}
