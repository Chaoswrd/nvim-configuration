local map = vim.keymap.set
-- map esc to jk
map("i", "jk", "<ESC>")
map("i", "<ESC>", "<NOP>")
map("n", "zz", ":update<cr>", { silent = true })

-- use system clipboard
map({ "n", "x" }, "cp", '"+y')
map({ "n", "x" }, "cv", '"+p')
-- select all
map("n", "<leader>a", ":keepjumps normal! ggVG<cr>", { silent = true })

-- change pane
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
