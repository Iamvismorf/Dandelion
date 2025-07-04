vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

return {
	{
		"nvim-ufo",
		after = function()
			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
			})
		end,
	},
	{
		"promise-async",
		dep_of = { "nvim-ufo" },
	},
	{
		"statuscol.nvim",
		dep_of = { "nvim-ufo" },
		after = function()
			local builtin = require("statuscol.builtin")
			require("statuscol").setup({
				ft_ignore = { "neo-tree" },
				bt_ignore = { "neo-tree" },
				relculright = true,
				segments = {
					{ text = { "%s" }, click = "v:lua.ScSa" },
					{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
					{ text = { builtin.foldfunc, "  " }, click = "v:lua.ScFa" },
				},
			})
		end,
	},
}
