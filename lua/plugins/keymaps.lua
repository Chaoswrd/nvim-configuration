local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- setup telescope commands
local telescope = require("telescope.builtin")
map("n", "<leader>ff", telescope.find_files, {})
map("n", "<leader>fg", telescope.live_grep, {})
map("n", "<leader>fb", telescope.buffers, {})
map("n", "<leader>fh", telescope.help_tags, {})
map("n", "<leader>gs", telescope.grep_string, {})

-- setup nvim-tree commands
map("n", "<C-n>", ":NvimTreeToggle<cr>", { silent = true })

-- setup tabline commands

-- Move to previous/next
map("n", "<tab>", "<Cmd>BufferNext<CR>", opts)
map("n", "<S-tab>", "<Cmd>BufferPrevious<CR>", opts)
-- Re-order to previous/next
-- map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
-- map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
-- Goto buffer in position...
-- map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
-- map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
-- map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
-- map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
-- map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
-- map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
-- map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
-- map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
-- map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
-- map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
-- Pin/unpin buffer
-- map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- Close buffer
map("n", "<leader>x", "<Cmd>BufferClose<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
-- map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
-- Sort automatically by...
-- map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
-- map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
-- map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
-- map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
--

-- Nvim Spider
map({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
map({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
map({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
map({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })

-- GitBlame
map("n", "<leader>b", ":ToggleBlameLine<CR>", { silent = true })
-- Git Merge Conflict
map("n", "<leader>dt", ":Git difftool<CR>", { silent = true })

-- LSP Config
-- -- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
map("n", "<space>e", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		map("n", "gD", vim.lsp.buf.declaration, opts)
		map("n", "gd", vim.lsp.buf.definition, opts)
		map("n", "K", vim.lsp.buf.hover, opts)
		map("n", "gi", vim.lsp.buf.implementation, opts)
		map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		map("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		map("n", "<space>D", vim.lsp.buf.type_definition, opts)
		map("n", "<space>rn", vim.lsp.buf.rename, opts)
		map({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		map("n", "gr", vim.lsp.buf.references, opts)
		map("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

-- Twilight
map("n", "<leader>t", ":Twilight<CR>", { silent = true })

-- Symbols Outline
map("n", "<leader>so", ":SymbolsOutline<CR>", { silent = true })
