return {
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = {
			style = "night",
		},
	},
	{
		"Skullamortis/forest.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	-- {
	-- 	"0xk3v/lavend3r",
	-- },
	-- {
	-- 	"LazyVim/LazyVim",
	-- 	opts = {
	-- 		colorscheme = "gruvbox",
	-- 	},
	-- },
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
