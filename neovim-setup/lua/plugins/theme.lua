-- monkai theme
-- return {
-- "tanvirtin/monokai.nvim",
-- config = function()
-- local monokai = require("monokai")
--   monokai.setup({ palette = monokai.soda })

--  end,
-- }

--vscode theme
return {
	"Mofiqul/vscode.nvim",
	config = function()
		local c = require("vscode.colors")

		require("vscode").setup({
			-- Alternatively set style in setup
			-- style = 'light'

			-- Enable transparent background
			transparent = true,

			-- Enable italic comment
			italic_comments = true,

			-- Underline `@markup.link.*` variants
			underline_links = true,

			-- Disable nvim-tree background color
			disable_nvimtree_bg = true,

			-- Override colors (see ./lua/vscode/colors.lua)
			color_overrides = {
				vscLineNumber = "#FFFFFF",
			},

			-- Override highlight groups (see ./lua/vscode/theme.lua)
			group_overrides = {
				-- this supports the same val table as vim.api.nvim_set_hl
				-- use colors from this colorscheme by requiring vscode.colors!
				Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
			},
		})
        vim.cmd.colorscheme "vscode"
	end,
}
