-- not working
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		--tree sitter config
		local config = require("nvim-treesitter.configs")
		config.setup({
			-- language installations
			ensure_installed = {
				"lua",
				"javascript",
				"typescript",
				"tsx",
				"python",
				"c_sharp",
				"html",
				"go",
				"gomod",
				"gosum",
				"gowork",
				"gitignore",
				"css",
				"scss",
				"sql",
				"rust",
				"java",
				"vue",
				"json",
			},
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = true,
		})
	end,
}
