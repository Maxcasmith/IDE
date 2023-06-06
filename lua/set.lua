local set = vim.opt

vim.g.mapleader = " "

set.nu = true
set.relativenumber = true

set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true

set.smartindent = true

set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

set.termguicolors = true

set.scrolloff = 8

set.updatetime = 50
