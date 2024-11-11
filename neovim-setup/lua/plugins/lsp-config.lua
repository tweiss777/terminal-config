return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "csharp_ls",
                    "cssls",
                    "dockerls",
                    "gopls",
                    "html",
                    "tsserver",
                    "jsonls",
                    "sqls",
                    --"anglularls",
                    "rust_analyzer",
                    "volar",
                    "jedi_language_server",
                    "harper_ls",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            -- lsp setups
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })

            lspconfig.harper_ls.setup({
            })

            -- anglularls not working
            --lspconfig.anglularls.setup({
            --})
            lspconfig.csharp_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.cssls.setup({
                capabilities = capabilities,
            })
            lspconfig.dockerls.setup({
                capabilities = capabilities,
            })
            lspconfig.gopls.setup({
                capabilites = capabilities,
            })
            lspconfig.html.setup({

                capabilities = capabilities,
            })
            lspconfig.tsserver.setup({
                capabilities = capabilities,
                init_options = {
                    plugins = {
                        {
                            name = "@vue/typescript-plugin",
                            location = "/opt/homebrew/lib/node_modules/@vue/language-server",
                            languages = { "vue" },
                        },
                    },
                },
                filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
            })
            lspconfig.jsonls.setup({
                capabilities = capabilities,
            })

            lspconfig.jedi_language_server.setup({
                cmd = { "jedi-language-server" },
                filetypes = { "python" },
                single_file_support = { true },
            })
            lspconfig.sqls.setup({
                capabilities = capabilities,
            })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
            })
            lspconfig.volar.setup({
                capabilities = capabilities,
            })
            lspconfig.tailwindcss.setup({})

            -- keymaps
            -- hover to get variable data
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            -- go to definition
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            -- see code actions
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            -- rename symbol
            vim.keymap.set({ "n", "v" }, "<leader>rs", vim.lsp.buf.rename, {})
            -- list references
            vim.keymap.set({ "n", "v" }, "<leader>lr", vim.lsp.buf.references, {})
        end,
    },
}
