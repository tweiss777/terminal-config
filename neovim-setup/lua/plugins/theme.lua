-- monkai theme
return {
	"tanvirtin/monokai.nvim",
    config = function()
        local monokai = require("monokai")
        monokai.setup({ palette = monokai.soda })
    end
}

-- original catpuccin theme
-- return {
--  "catppuccin/nvim",
-- name = "catppuccin",
-- priority = 1000,
-- config = function()
-- vim.cmd.colorscheme("catppuccin-mocha")
-- end,
-- }
