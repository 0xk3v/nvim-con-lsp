return {
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = { style = "night" },
	},
	{
		"0xk3v/lavend3r",
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "lavend3r",
		},
	},
	{
		"tiagovla/tokyodark.nvim",
		opts = {
			-- custom options here
		},
		config = function(_, opts)
			require("tokyodark").setup(opts) -- calling setup is optional
			vim.cmd([[colorscheme tokyodark]])
		end,
	},
}
