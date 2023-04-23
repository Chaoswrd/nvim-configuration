vim.opt.encoding = "utf-8"
-- On pressing tab, insert 2 spaces
vim.opt.expandtab = true
-- show existing tab with 2 spaces width
vim.opt.tabstop=2
vim.opt.softtabstop=2
-- when indenting with '>', use 2 spaces width
vim.opt.shiftwidth=2
-- map esc to jk  
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('i', '<ESC>', '<NOP>')
vim.keymap.set('n', 'zz', ':update<cr>')

-- set numbers
vim.opt.number = true
-- wrap text
vim.opt.wrap = true
-- set leader to space
vim.g.mapleader = ' '
-- use system clipboard
vim.keymap.set({'n', 'x'}, 'cp', '"+y')
vim.keymap.set({'n', 'x'}, 'cv', '"+p')
-- select all
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>', {silent=true})
-- reload source
vim.keymap.set('n', '<leader>r', ':source $MYVIMRC<cr>', {silent=true})


-- set up Lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  'folke/tokyonight.nvim',
  'nvim-lualine/lualine.nvim',
  {
    'nvim-treesitter/nvim-treesitter',
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require "plugins.configs.treesitter"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  }
}
require("lazy").setup(plugins)

-- setup telescope commands
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})
vim.keymap.set('n', '<leader>gs', telescope.grep_string, {})


-- setup tokyonight theme
vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight-night')

