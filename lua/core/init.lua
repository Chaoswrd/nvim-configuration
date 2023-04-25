require("core.utils")

local options = {
  cursorline = true,
  encoding = "utf-8",
  -- On pressing tab, insert 2 spaces
  expandtab = true,
  -- show existing tab with 2 spaces width
  tabstop = 2,
  softtabstop = 2,
  -- when indenting with '>', use 2 spaces width
  shiftwidth = 2,
  -- set numbers
  number = true,
  -- wrap text
  wrap = true,
}

local global = {
  -- set leader to space
  mapleader = " ",
}

TableMerge(vim.opt, options)
TableMerge(vim.g, global)

require("core.keymaps")
