return {

    "mfussenegger/nvim-dap",
    dependencies = {
        "leoluz/nvim-dap-go",
        "rcarriga/nvim-dap-ui",
        "tpope/vim-fugitive",
        "mfussenegger/nvim-dap-python",
        "mxsdev/nvim-dap-vscode-js",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        require("dapui").setup()
        require("dap-go").setup({
            dap_configurations = {
                {
                    type = "go",
                    name = "Debug",
                    request = "launch",
                    program = "${file}",
                },
            },
        })

        require("dap-vscode-js").setup({
            -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
            debugger_path = "/Users/talweiss/vscode-js-debug", -- Path to vscode-js-debug installation.
            -- debugger_cmd = { "extension" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
            adapters = {
                "chrome",
                "pwa-node",
                "pwa-chrome",
                "pwa-msedge",
                "node-terminal",
                "pwa-extensionHost",
                "node",
                "chrome",
            },
            debugOptions = {
                sourceMaps = true,
                protocol = "inspector",
            },
            -- Use ts-node as the debugger
            -- which adapters to register in nvim-dap
            -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
            -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
            -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
        })

        local dap, dapui = require("dap"), require("dapui")

        -- typescriptreact settings
        dap.configurations.typescriptreact = {
            {
                type = "pwa-chrome",
                request = "launch",
                name = 'Start Chrome with "localhost"',
                url = "http://localhost:3000",
                webRoot = "${workspaceFolder}",
                userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
            },
        }
        -- typescript settings
        dap.configurations.typescript = {

            {
                type = "pwa-node",
                request = "launch",
                name = "Debug Jest Tests",
                -- trace = true, -- include debugger info
                runtimeExecutable = "node",
                runtimeArgs = {
                    "./node_modules/jest/bin/jest.js",
                    "--runInBand",
                },
                rootPath = "${workspaceFolder}",
                cwd = "${workspaceFolder}",
                console = "integratedTerminal",
                internalConsoleOptions = "neverOpen",
            },
            {
                type = "pwa-node",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                runtimeArgs = { "-r", "ts-node/register" },
                cwd = "${workspaceFolder}",
                protocol = "inspector",
            },
            -- javascript setup
            {
                type = "pwa-node",
                request = "attach",
                name = "Attach to NodeJS Backend",
                port = 9229,
                restart = true,
                trace = true,
                outFiles = { "${workspaceFolder}/**/*.js" },
                localRoot = "${workspaceFolder}",
                remoteRoot = "${workspaceFolder}",
                protocol = "inspector",
                sourceMaps = true,
                webRoot = "${workspaceFolder}",
            },
        }
        -- javascript settings
        dap.configurations.javascript = {
            {
                type = "pwa-node",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                cwd = "${workspaceFolder}",
            },
            {
                type = "pwa-node",
                request = "attach",
                name = "Attach",
                processId = require("dap.utils").pick_process,
                cwd = "${workspaceFolder}",
            },
            {
                type = "pwa-chrome",
                request = "launch",
                name = 'Start Chrome with "localhost"',
                url = "http://localhost:3000",
                webRoot = "${workspaceFolder}",
                userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
            },
        }

        -- python debugger setup
        local dap_python = require("dap-python")
        dap_python.setup("~/.virtualenvs/debugpy/bin/python")

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        --dotnet configuration
        dap.adapters.coreclr = {
            type = "executable",
            command = "/Users/talweiss/netcoredbg/bin/netcoredbg",
            args = { "--interpreter=vscode" },
        }
        dap.configurations.cs = {
            -- for a console app
            {
                type = "coreclr",
                name = "launch console debugging - netcoredbg",
                request = "launch",
     --           env ="ASPNETCORE_ENVIRONMENT=Development",
                args = {
                    "--urls=http://localhost:3000",
	--				"--environment=Development"
                },
                program = function()
                    -- see if you can initiate dotnet build before debugging
                    print("Building...")
                    local build_result = os.execute("dotnet build > null 2>&1")
                    if build_result == 0 then
                        print("Build successful")
                    else
                        print("Build failed")
                        -- Optionally handle the failure, for example:
                        return nil -- Return nil to cancel the debug launch
                    end
                    return vim.fn.input("Path to project dll->", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = function()
                    return vim.fn.input("Workspace folder: ", vim.fn.getcwd() .. "/", "file")
                end,
            },
        }

        -- debugger bindings
        -- toggle breakpoint
        vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
        -- Continue execution / enable debugger
        vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
        -- Terminate debugger
        vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
        -- step over to next line
        vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
        -- step into next line
        vim.keymap.set("n", "<Leader>di", ":DapStepInto<CR>")
        -- step out
        vim.keymap.set("n", "<Leader>de", ":DapStepOut<CR>")
    end,
}
