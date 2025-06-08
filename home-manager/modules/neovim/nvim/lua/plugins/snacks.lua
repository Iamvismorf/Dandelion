return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		bufdelete = { enabled = true },
		picker = { enabled = true },

		scroll = {
			enabled = true,
			animate_repeat = {
				duration = { step = 0, total = 2 },
			},
		},
	},
}
