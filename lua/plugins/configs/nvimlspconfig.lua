local options = {
  lua_ls = {},
  yamlls = {
    settings = {
      yaml = {
        keyOrdering = false,
      },
    },
  },
  jedi_language_server = {},
  clangd = {},
  rust_analyzer = {},
}
return options
