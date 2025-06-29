require("kanso").setup({
	italics = false,
	undercurl = true,
	colors = {
		theme = {
			ink = {
				ui = {
					float = {
						fg_border = require("kanso.colors").setup({ theme = "ink" }).palette.inkGray2,
					},
				},
			},
		},
	},
	overrides = function(c)
		return {
			WinSeparator = { fg = c.palette.inkGray2 },
		}
	end,
})
