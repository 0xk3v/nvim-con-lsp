return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason.nvim" },
		opts = function()
			local nls = require("null-ls")
			return {
				sources = {
					-- nls.builtins.formatting.prettierd,
					nls.builtins.formatting.prettier,
					nls.builtins.formatting.stylelint,
					-- nls.builtins.formatting.eslint,
					-- nls.builtins.code_actions.eslint,
					-- nls.builtins.diagnostics.eslint,

					-- Python
					-- nls.builtins.diagnostics.flake8,
					nls.builtins.formatting.black.with({ extra_args = { "--fast" } }),

					-- Lua
					nls.builtins.formatting.stylua,

					-- Dart
					nls.builtins.formatting.dart_format,

					-- C++
					nls.builtins.formatting.clang_format,
					nls.builtins.diagnostics.clang_check.with({ extra_args = { "--std=c++20" } }),
					nls.builtins.diagnostics.cpplint,
				},
			}
		end,
	},
}
