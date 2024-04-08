 return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local neotree = require("neo-tree")
		neotree.setup({
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			},
		})
		vim.keymap.set("n", "<C-t>", ":Neotree filesystem toggle right<CR>", {})
	end,
}


-- Other tree that I dont like 
-- return {
--     "DaikyXendo/nvim-tree.lua",
--     dependencies = {
--         "DaikyXendo/nvim-material-icon",
--     },
--     config = function()
--         vim.g.loaded_netrw = 1
--         vim.g.loaded_netrwPlugin = 1
--         local nvimTree = require("nvim-tree")
--         nvimTree.setup({
--             filters = {
--                 dotfiles = true,
--             },
--             git = {
--                 enable = true,
--                 ignore = true,
--             },
--             view = {
--                 side = "right",
--             },
--         })
--         vim.keymap.set("n", "<C-t>", ":NvimTreeToggle<CR>", {})
--     end,
-- }
