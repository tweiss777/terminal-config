return {
    -- Main testing dependency
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/neotest-jest",
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-jest")({
                    jestCommand = "yarn test", -- Adjust this based on your npm command
                    jestConfigFile = "jest.config.js", -- If you have a Jest config file
                    env = { CI = true },
                    jest_test_discovery = false,
                    discovery = {
                         enabled = false,
                        -- pattern = "**/__tests__/**",
                        -- exclude_pattern = "**/node_modules/**",
                    },
                    cwd = function(path)
                        -- Assuming tests are in a 'tests' folder
                        local relative_path = vim.fn.fnamemodify(path, ":~:.")
                        if string.match(relative_path, "^tests/") then
                            return vim.fn.getcwd()
                        end
                        return vim.fn.getcwd()
                    end,
                }),
            },
        })
    end,
}
