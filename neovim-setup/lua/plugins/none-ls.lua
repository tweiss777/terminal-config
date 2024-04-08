-- diagnostics, formatting and linting
return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
                -- not using the es-linter as I dont wan't too many errors!
                -- null_ls.builtins.diagnostics.eslint_d,
                null_ls.builtins.diagnostics.gospel
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
