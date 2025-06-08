return {
	"nvim-lualine/lualine.nvim",
	-- dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		options = {
			disabled_filetypes = {
				statusline = { "neo-tree" },
			},
		},
		sections = {
			lualine_a = {
				{
					"mode",
					icons_enabled = true,
					-- icon = '󰮬 ',
					icon = "󱎶 ",
				},
			},
			lualine_b = { "branch" },
			lualine_c = {
				{
					"filename",
					path = 3,
				},
			},
			lualine_x = {
				{
					"diagnostics",
					symbols = {
						error = " ", -- xf659, shows up in my terminal
						warn = " ", -- xf529, idem
						hint = "󰌵 ", -- xf7fc, idem
						info = " ", -- xf835, idem
					},
				},
				"diff",
			},
			lualine_y = { "filetype" },
			lualine_z = { "progress" },
		},
	},
}
