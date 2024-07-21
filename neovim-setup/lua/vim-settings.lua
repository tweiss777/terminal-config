-- vim settings file:
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=4")
vim.cmd("set nu")
vim.cmd("syntax on")
vim.cmd("set encoding=utf8")
vim.g.mapleader = " "
vim.keymap.set('n', '<C-s>',':vsp<CR>', {} )
--vim.keymap.set('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
vim.keymap.set('n', '<C-d>',':lua require("vscode").load("light")', {} )
vim.keymap.set('n', '<C-l>', ':lua require("vscode").load("dark")', {} )

