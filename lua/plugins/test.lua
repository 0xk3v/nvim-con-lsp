return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"marilari88/neotest-vitest",
			"nvim-neotest/neotest-jest",
			"fredrikaverpil/neotest-golang",
			"nvim-neotest/nvim-nio",
		},
    -- stylua: ignore
		-- opts = function(_, opts)
		-- 	table.insert(opts.adapters, require("neotest-vitest"))
		--     table.insert(opts, require("neotest-jest"))
		-- end,

		opts = {
			adapters = {
				["neotest-vitest"] = {},
				["neotest-golang"] = {},
				["neotest-jest"] = {
					jestCommand = "pnpm test:e2e --",
					jestConfigFile = "custom.jest.config.ts",
					env = { CI = true },
					cwd = function(path)
						return vim.fn.getcwd()
					end,
				},
			},
		},
	},
}
