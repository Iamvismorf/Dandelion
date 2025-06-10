return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		{
			"s1n7ax/nvim-window-picker",
			name = "window-picker",
			event = "VeryLazy",
			version = "2.*",
			config = function()
				-- local colors = require("tokyonight.colors").setup()
				require("window-picker").setup({
					highlights = {
						enabled = false,
						statusline = {
							focused = {
								-- fg = colors.yellow,
								bg = "",
								bold = true,
							},
							unfocused = {
								-- fg = colors.yellow,
								bg = "",
								bold = true,
							},
						},
					},
				})
			end,
		},
		"MunifTanjim/nui.nvim",
		-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	lazy = false, -- neo-tree will lazily load itself

	opts = {
		default_component_configs = {
			indent = {
				with_expanders = true,
			},
		},
		close_if_last_window = true,
		source_selector = {
			winbar = false, -- disables the top bar
			statusline = false, -- disables from showing in the status line (if set)
		},

		filesystem = {
			follow_current_file = {
				enabled = true,
				leave_dirs_open = true,
			},
			filtered_items = {
				hide_dotfiles = false,
			},
			window = {
				width = 30,
				position = "right",
			},
		},
		-- default_component_configs = {
		--    indent = {
		--       padding = 2,
		--    }
		-- },
		window = {
			mappings = {
				["/"] = "noop",
				["f"] = "noop",
				["<esc>"] = "noop",
				["*"] = "expand_all_nodes",
				-- ["<cr>"] = "open",
				["<cr>"] = "open_with_window_picker",
			},
		},
		event_handlers = {
			{
				event = "neo_tree_buffer_enter",
				handler = function()
					vim.cmd("stopinsert")
					vim.opt_local.relativenumber = true
				end,
			},
			{
				event = "file_opened",
				handler = function()
					vim.cmd([[Neotree focus]])
				end,
			},
		},
	},
	vim.keymap.set({ "n", "v", "c", "i" }, "<C-n>", "<esc>:Neotree toggle right filesystem reveal<CR>"),
}
