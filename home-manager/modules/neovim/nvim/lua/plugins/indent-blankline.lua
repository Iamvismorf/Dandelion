vim.g.indent_blankline_use_treesitter = false
return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		indent = {
			char = "│",
		},
		scope = {
			show_start = false,
			-- show_end = false,
			include = {
				node_type = {
					["*"] = { "*" },
				},
			},
		},
	},
}
