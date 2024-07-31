-- vim settings file:
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=4")
vim.cmd("set nu")
vim.cmd("syntax on")
vim.cmd("set encoding=utf8")
vim.g.mapleader = " "
vim.keymap.set("n", "<C-s>", ":vsp<CR>", {})
--vim.keymap.set('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
vim.keymap.set("n", "<C-d>", ':lua require("vscode").load("light")', {})
vim.keymap.set("n", "<C-l>", ':lua require("vscode").load("dark")', {})
--
-- Keybinding for running the nearest test
vim.api.nvim_set_keymap("n", "<leader>tt", ':lua require("neotest").run.run()<CR>', { noremap = true, silent = true })

-- Keybinding for running tests in the current file
vim.api.nvim_set_keymap(
    "n",
    "<leader>tf",
    ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>',
    { noremap = true, silent = true }
)

-- Keybinding for opening the test output
vim.api.nvim_set_keymap(
    "n",
    "<leader>to",
    ':lua require("neotest").output.open()<CR>',
    { noremap = true, silent = true }
)

-- Keybinding for opening the test summary
vim.api.nvim_set_keymap(
    "n",
    "<leader>ts",
    ':lua require("neotest").summary.open()<CR>',
    { noremap = true, silent = true }
)

-- Keybinding for stopping the running tests
vim.api.nvim_set_keymap("n", "<leader>tq", ':lua require("neotest").run.stop()<CR>', { noremap = true, silent = true })
