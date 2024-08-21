local options = { -- Use command :LspLog to debug lsps, remember to update init.lua and install lsp
  lua_ls = {},
  yamlls = {
    settings = {
      yaml = {
        keyOrdering = false,
      },
    },
  },
  jedi_language_server = {},
  jdtls = {},
  clangd = {
    offset_encoding = 'utf-8'
  },
  rust_analyzer = {},
  gopls = {},
}
return options
