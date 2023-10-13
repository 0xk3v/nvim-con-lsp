return {
	{
		"stevearc/conform.nvim",
		dependencies = { "mason.nvim" },
		lazy = true,
		cmd = "ConformInfo",
		keys = {
			{
				"<leader>cF",
				function()
					require("conform").format({ formatters = { "injected" } })
				end,
				mode = { "n", "v" },
				desc = "Format Injected Langs",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				sh = { "shfmt" },
				javascript = { { "prettierd", "prettier" } },
				java = { { "astyle", "google-java-format" } },
			},
			format_on_save = {
				-- I recommend these options. See :help conform.format for details.
				lsp_fallback = true,
				timeout_ms = 500,
			},
			-- LazyVim will merge the options you set here with builtin formatters.
			-- You can also define any custom formatters here.
			---@type table<string,table>
			formatters = {
				injected = { options = { ignore_errors = true } },
				-- -- Example of using dprint only when a dprint.json file is present
				-- dprint = {
				--   condition = function(ctx)
				--     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
				--   end,
				-- },
			},
		},
		config = function(_, opts)
			opts.formatters = opts.formatters or {}
			for name, formatter in pairs(opts.formatters) do
				if type(formatter) == "table" then
					local ok, defaults = pcall(require, "conform.formatters." .. name)
					if ok and type(defaults) == "table" then
						opts.formatters[name] = vim.tbl_deep_extend("force", {}, defaults, formatter)
					end
				end
			end
			require("conform").setup(opts)
		end,
	},
}
