require("lze").register_handlers(require("nixCatsUtils.lzUtils").for_cat)

require("lze").load({

	{ import = "vismorf.cmp" },
	{ import = "vismorf.format" },
	{ import = "vismorf.lint" },
	{ import = "vismorf.lsp" },
})
require("vismorf.config")
require("vismorf.plugins")
vim.cmd.colorscheme("kanso")
local file = vim.api.nvim_buf_get_name(0)
local is_dir = vim.fn.isdirectory(file) == 1

if is_dir then
	vim.cmd.cd(file)
end
