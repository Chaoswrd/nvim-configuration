local options = {
	ensure_installed = { "c", "lua", "vim", "python", "yaml", "terraform", "rust", "make", "java", "go" },
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true },
}
return options
