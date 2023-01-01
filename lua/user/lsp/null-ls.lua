local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.keymap.set("n", "<Leader>f", function()
				vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
			end, { buffer = bufnr, desc = "[lsp] format" })

			-- format on save
			vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
			vim.api.nvim_create_autocmd(event, {
				buffer = bufnr,
				group = group,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr, async = async })
				end,
				desc = "[lsp] format on save",
			})
		end

		if client.supports_method("textDocument/rangeFormatting") then
			vim.keymap.set("x", "<Leader>f", function()
				vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
			end, { buffer = bufnr, desc = "[lsp] format" })
		end
	end,
	debug = false,
	sources = {

		--  Web Dev
		formatting.prettier,
		formatting.stylelint,

		-- Python
		formatting.black.with({ extra_args = { "--fast" } }),

		-- Lua
		formatting.stylua,

		-- Dart
		formatting.dart_format,

		-- C++
		formatting.clang_format,
		diagnostics.clang_check,
		diagnostics.cpplint,

		-- Text Files
		formatting.codespell,
	},
})

local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local FORMATTING = methods.internal.FORMATTING
local RANGE_FORMATTING = methods.internal.RANGE_FORMATTING

return h.make_builtin({
	name = "clang_format",
	meta = {
		url = "https://www.kernel.org/doc/html/latest/process/clang-format.html",
		description = "Tool to format C/C++/… code according to a set of rules and heuristics.",
	},
	method = { FORMATTING, RANGE_FORMATTING },
	filetypes = { "c", "cpp" },
	generator_opts = {
		command = "clang-format",
		args = h.range_formatting_args_factory(
			-- { "-style='BasedOnStyle: Google'" },
			{ "-assume-filename", "$FILENAME" },
			"--offset",
			"--length",
			{ use_length = true, row_offset = -1, col_offset = -1 }
		),
		to_stdin = true,
	},
	factory = h.formatter_factory,
})
