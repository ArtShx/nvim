local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

require 'nvim-treesitter.install'.compilers = { "zig", "gcc" }
 local to_install = { "bash", "c", "javascript", "json", "lua", "python", "yaml", "markdown", "markdown_inline" , "vim", "vimdoc" }
configs.setup({
  ensure_installed = { to_install }, -- one of "all" or a list of languages
	ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
})
