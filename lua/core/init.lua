
vim.opt.encoding = "utf-8"
-- On pressing tab, insert 2 spaces
vim.opt.expandtab = true
-- show existing tab with 2 spaces width
vim.opt.tabstop=2
vim.opt.softtabstop=2
-- when indenting with '>', use 2 spaces width
vim.opt.shiftwidth=2

-- set numbers
vim.opt.number = true
-- wrap text
vim.opt.wrap = true
-- set leader to space
vim.g.mapleader = ' '

require "keymaps"
