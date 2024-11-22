-- Help: use :h and then the plugin name to get the help text
--
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

-- WhichKey Key mappings
-- ' brings up marks from the marks plugin
-- " brings up registers from the registers plugin
-- z= brings up spelling suggestions
-- <c-w> brings up window commands
-- Most commands show up if you click a key that requires another letter
--  Scroll up and down in the pop up using: <c-u> and <c-d>
--
local telescope = require("telescope.builtin")
local keymaps = {
  -- setup telescope commands
  {
    "<leader>f",
    group = "Telescope",
    icon = "",
  },
  {
    "<leader>ff",
    telescope.find_files,
    desc = "Fuzzy find files",
  },
  {
    "<leader>fg",
    telescope.live_grep,
    desc = "Grep text in files",
  },
  {
    "<leader>fb",
    telescope.buffers,
    desc = "Search in buffers",
  },
  {
    "<leader>fh",
    telescope.help_tags,
    desc = "Search for help tags",
  },
  {
    "<leader>fs",
    telescope.grep_string,
    desc = "Grep for string in files",
  },
  -- setup nvim-tree commands
  {
    "<leader>t",
    ":NvimTreeToggle<cr>",
    desc = "Toggle Nvim Tree",
    silent = true,
  },
  -- setup tabline commands
  {
    "<tab>",
    "<Cmd>BufferNext<CR>",
    desc = "Move to next buffer",
  },
  {
    "<S-tab>",
    "<Cmd>BufferPrevious<CR>",
    desc = "Move to previous buffer",
  },
  {
    "<leader>x",
    "<Cmd>BufferClose<CR>",
    desc = "Close the current buffer",
  },
  -- Nvim Spider
  {
    "w",
    "<cmd>lua require('spider').motion('w')<CR>",
    desc = "Spider-w",
    mode = { "n", "o", "x" },
  },
  {
    "e",
    "<cmd>lua require('spider').motion('e')<CR>",
    desc = "Spider-e",
    mode = { "n", "o", "x" },
  },
  {
    "b",
    "<cmd>lua require('spider').motion('b')<CR>",
    desc = "Spider-b",
    mode = { "n", "o", "x" },
  },
  {
    "ge",
    "<cmd>lua require('spider').motion('ge')<CR>",
    desc = "Spider-ge",
    mode = { "n", "o", "x" },
  },
  -- GitBlame
  {
    "<leader>b",
    ":ToggleBlameLine<CR>",
    desc = "Toggle Blame Line",
    silent = true,
  },
  -- Git Merge Conflict
  {
    "<leader>d",
    group = "Git Diff",
  },
  {
    "<leader>dt",
    ":Git difftool<CR>",
    desc = "Git Diff Tool",
    silent = true,
  },
  -- LSP Config
  -- -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  -- map("n", "<space>e", vim.diagnostic.open_float)
  -- map("n", "[d", vim.diagnostic.goto_prev)
  -- map("n", "]d", vim.diagnostic.goto_next)
  -- map("n", "<space>q", vim.diagnostic.setloclist)
  --
  -- Twilight
  {
    "<leader>t",
    ":Twilight<CR>",
    desc = "Twilight",
    silent = true,
    icon = "",
  },
  -- Symbols Outline
  {
    "<leader>s",
    ":SymbolsOutline<CR>",
    group = "Symbols",
    icon = "",
    silent = true,
  },
  {
    "<leader>so",
    ":SymbolsOutline<CR>",
    desc = "Get file symbols",
    silent = true,
  },
  -- Trouble
  {
    "<leader>x",
    group = "Trouble Git",
  },
  {
    "<leader>xx",
    "<cmd>TroubleToggle<cr>",
    desc = "Toggle Trouble",
    silent = true,
  },
  {
    "<leader>xw",
    "<cmd>TroubleToggle workspace_diagnostics<cr>",
    desc = "Toggle Workspace Diagnostics",
    silent = true,
  },
  {
    "<leader>xd",
    "<cmd>TroubleToggle document_diagnostics<cr>",
    desc = "Toggle Document Diagnostics",
    silent = true,
  },
  {
    "<leader>xl",
    "<cmd>TroubleToggle loclist<cr>",
    desc = "Toggle Loclist",
    silent = true,
  },
  {
    "<leader>xl",
    "<cmd>TroubleToggle quickfix<cr>",
    desc = "Toggle Quick Fix",
    silent = true,
  },
  {
    "<leader>xlr",
    "<cmd>TroubleToggle lsp_references<cr>",
    desc = "Toggle LSP References",
    silent = true,
  },
}
return keymaps

--[[
local map = vim.keymap.set
local opts = { noremap = true, silent = true }



--]]
