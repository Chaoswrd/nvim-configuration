local plugins = {
  -- Theme
  "folke/tokyonight.nvim",
  -- Git integration
  "tpope/vim-fugitive",
  -- Git Merge Conflict Highlighting, perfect with :Git difftool
  {
    "akinsho/git-conflict.nvim",
    opts = function()
      return require("plugins.configs.gitconflict")
    end,
    config = function(_, opts)
      require("git-conflict").setup(opts)
    end,
  },
  -- Git Blame line
  "tveskag/nvim-blame-line",
  -- Git
  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      return {}
    end,
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },
  -- CamelCase Movement
  {
    "chrisgrieser/nvim-spider",
    opts = function()
      require("plugins.configs.nvimspider")
    end,
    config = function(_, opts)
      return require("spider").setup(opts)
    end,
    lazy = true,
  },
  --Dashboard
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      return require("plugins.configs.dashboardnvim")
    end,
    config = function(_, opts)
      require("dashboard").setup(opts)
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
  -- Which Key
  {
    "folke/which-key.nvim",
    opts = function()
      return {}
    end,
    config = function(_, opts)
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup(opts)
    end,
  },
  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
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
      return require("plugins.configs.lualine")
    end,
    config = function(_, opts)
      require("lualine").setup(opts)
    end,
  },
  -- Tabline
  {
    "romgrk/barbar.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    version = "*",
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
      return require("plugins.configs.masonlspconfig")
    end,
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
    end,
  },
  -- LSP config
  {
    "neovim/nvim-lspconfig",
    opts = function()
      return require("plugins.configs.nvimlspconfig")
    end,
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup(opts.lua_ls)
      lspconfig.yamlls.setup(opts.yamlls)
      lspconfig.jedi_language_server.setup(opts.jedi_language_server)
      lspconfig.clangd.setup(opts.clangd)
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
      return require("plugins.configs.nullls")
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
  -- "hrsh7th/vim-vsnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      return require("plugins.configs.nvimcmp")
    end,
    config = function(_, opts)
      local cmp = require("cmp")
      cmp.setup(opts.main)

      cmp.setup.filetype("gitcommit", opts.gitcommit)

      cmp.setup.cmdline({ "/", "?" }, opts.slashquestion)

      cmp.setup.cmdline(":", opts.colon)
    end,
  },
  -- vsnip connection
  --"hrsh7th/cmp-vsnip",
  -- "SirVer/ultisnips",
  -- GitHub CoPilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
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
