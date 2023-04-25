local plugins = {
  -- Theme
  "folke/tokyonight.nvim",
  -- Git conflicts
  {
    "akinsho/git-conflict.nvim",
    opts = function()
      return {
        default_mappings = true, -- disable buffer local mapping created by this plugin
        default_commands = true, -- disable commands created by this plugin
        disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
        highlights = {
          -- They must have background color, otherwise the default color will be used
          incoming = "DiffText",
          current = "DiffAdd",
        },
      }
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
    config = function()
      return require("spider").setup({
        skipInsignificantPunctuation = false,
      })
    end,
    lazy = true,
  },
  --Dashboard
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      return {
        theme = "hyper",
        config = {
          week_header = { enable = true },
          disable_move = true,
        },
      }
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
          "lua_ls",          -- Lua Language Server
          "yamlls",          -- Yaml Language Server
          "jedi_language_server", -- Python Language Server
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
      require("lspconfig").yamlls.setup({})
      require("lspconfig").jedi_language_server.setup({})
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
          null_ls.builtins.formatting.black,
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
  -- "hrsh7th/vim-vsnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require("cmp")
      return {
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          -- { name = "vsnip" }, -- For vsnip users.
          -- { name = 'luasnip' }, -- For luasnip users.
          -- { name = 'ultisnips' }, -- For ultisnips users.
          -- { name = 'snippy' }, -- For snippy users.
        }, {
          { name = "buffer" },
        }),
      }
    end,
    config = function(_, opts)
      local cmp = require("cmp")
      cmp.setup(opts)

      -- Set configuration for specific filetype.
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
          { name = "buffer" },
        }),
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
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
      require("copilot").setup({})
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
