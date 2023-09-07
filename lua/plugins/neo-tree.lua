return {
	-- Configure Neo-tree
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{
			"e",
			function()
				require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
			end,
			desc = "Explorer NeoTree (root dir)",
		},
		{
			"e",
			function()
				require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
			end,
			desc = "Explorer NeoTree (cwd)",
		},
		{ "e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
		{ "E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
	},
	deactivate = function()
		vim.cmd([[Neotree close]])
	end,
	-- init = function()
	-- 	vim.g.neo_tree_remove_legacy_commands = 1
	-- 	if vim.fn.argc() == 1 then
	-- 		local stat = vim.loop.fs_stat(vim.fn.argv(0))
	-- 		if stat and stat.type == "directory" then
	-- 			require("neo-tree")
	-- 		end
	-- 	end
	-- end,
	opts = {
		filesystem = {
			bind_to_cwd = false,
			follow_current_file = true,
		},
		window = {
			width = 30,
			mappings = {
				["<space>"] = "none",
				["v"] = "open_vsplit",
				["l"] = "open",
				["e"] = "close_window",
			},
		},
	},
}
