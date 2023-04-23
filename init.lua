require "core"
require "plugins"


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

