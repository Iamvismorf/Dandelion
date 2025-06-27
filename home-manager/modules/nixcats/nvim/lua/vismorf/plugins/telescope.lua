return {

	"telescope.nvim",
	-- dependencies = {
	-- 	"nvim-lua/plenary.nvim",
	-- 	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	-- 	-- "nvim-tree/nvim-web-devicons",
	-- },

	after = function()
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")
		require("telescope").setup({
			pickers = {
				find_files = {
					hidden = true,
				},
			},
			extensions = {
				fzf = {},
			},
			defaults = {
				border = false,
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,

						["<C-n>"] = false,
						["<C-p>"] = false,
					},
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
	end,
}
