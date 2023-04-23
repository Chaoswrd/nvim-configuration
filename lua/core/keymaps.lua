-- map esc to jk  
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('i', '<ESC>', '<NOP>')
vim.keymap.set('n', 'zz', ':update<cr>')

-- use system clipboard
vim.keymap.set({'n', 'x'}, 'cp', '"+y')
vim.keymap.set({'n', 'x'}, 'cv', '"+p')
-- select all
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>', {silent=true})
-- reload source
vim.keymap.set('n', '<leader>r', ':source $MYVIMRC<cr>', {silent=true})
