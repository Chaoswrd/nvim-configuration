local plugins = {
  -- Theme
  'folke/tokyonight.nvim',
  -- File Explorer
  {
    'nvim-tree/nvim-tree.lua',
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    init = function()
    --  require("core.utils").load_mappings "nvimtree"
    end,
    opts = function()
      return require "plugins.configs.nvimtree"
    end,
    config = function(_, opts)
      require("nvim-tree").setup(opts)
      vim.g.nvimtree_side = opts.view.side
    end,
  },
  -- Status bar
  {
    'nvim-lualine/lualine.nvim',
    opts = function()
      return {}
    end,
    config = function(_, opts)
      require("lualine").setup(opts)
    end,
  },
  -- Syntax Highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require "plugins.configs.treesitter"
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
  -- LSP config
  {
    'neovim/nvim-lspconfig'
  },
  -- Fuzzy Search
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  }
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

require "plugins.keymaps"

-- setup tokyonight theme
vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight-night')
