local plugins = {
	-- Theme
	"folke/tokyonight.nvim",
	-- File Explorer
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		init = function()
			--  require("core.utils").load_mappings "nvimtree"
		end,
		opts = function()
			return require("plugins.configs.nvimtree")
		end,
		config = function(_, opts)
			require("nvim-tree").setup(opts)
			vim.g.nvimtree_side = opts.view.side
		end,
	},
	-- Status bar
	{
		"nvim-lualine/lualine.nvim",
		opts = function()
			return {}
		end,
		config = function(_, opts)
			require("lualine").setup(opts)
		end,
	},
	-- Tabline
	{
		"romgrk/barbar.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		init = function()
			vim.g.barbar_auto_setup = false
		end,
	},
	-- Syntax Highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = function()
			return require("plugins.configs.treesitter")
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	-- LSP package manager
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
		opts = function()
			return {}
		end,
		config = function(_, opts)
			require("mason").setup(opts)
		end,
	},
	{
		"williamboman/mason-lspconfig",
		opts = function()
			return {
				ensure_installed = {
					"lua_ls", -- Lua Language Server
				},
			}
		end,
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)
		end,
	},
	-- LSP config
	{
		"neovim/nvim-lspconfig",
		opts = function()
			return {}
		end,
		config = function(_, opts)
			require("lspconfig").lua_ls.setup({})
		end,
	},
	-- DAP server
	{
		"mfussenegger/nvim-dap",
	},
	-- Lint & Formatter
	{
		"jose-elias-alvarez/null-ls.nvim",
		opts = function()
			local null_ls = require("null-ls")
			-- this + on_attach formats on save
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			return {
				-- you can reuse a shared lspconfig on_attach callback here
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.completion.spell,
				},
			}
		end,
		config = function(_, opts)
			require("null-ls").setup(opts)
		end,
	},
	-- Fuzzy Search
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}

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
require("lazy").setup(plugins)

require("plugins.keymaps")

-- setup tokyonight theme
vim.opt.termguicolors = true
vim.cmd.colorscheme("tokyonight-night")
