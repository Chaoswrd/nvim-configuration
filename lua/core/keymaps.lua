local map = vim.keymap.set
-- map esc to jk
map("i", "jk", "<ESC>")
map("i", "<ESC>", "<NOP>")
-- Movement vertically (H, M, L)
-- Move screen to cursor (zt, zz, zb)
-- Move full page (ctrl-f, ctrl-b)
-- Move half page (ctrl-u, ctrl-d)
-- use system clipboard
map({ "n", "x" }, "cp", '"+y')
map({ "n", "x" }, "cv", '"+p')
-- select all
map("n", "<leader>a", ":keepjumps normal! ggVG<cr>", { silent = true })

-- change pane
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")

-- Toggle numbers
map("n", "<leader>n", ":set number! relativenumber!<cr>")
