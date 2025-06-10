return {
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		event = "VimEnter",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
			show_dirname = false,
			show_modified = true,
		},
	},
	-- {
	-- 	"SmiteshP/nvim-navic",

	-- 	-- event = "LspAttach",
	-- 	config = function()
	-- 		require("nvim-navic").setup({
	-- 			highlight = true,
	-- 			lsp = { auto_attach = true },
	-- 			depth_limit = 6,
	-- 		})

	-- 		vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
	-- 	end,
	-- },
	-- {
	-- 	"Ramilito/winbar.nvim",
	-- 	-- "Iamvismorf/winbr.nvim",
	-- 	event = "VimEnter", -- Alternatively, BufReadPre if we don't care about the empty file when starting with 'nvim'
	-- 	-- event = "BufReadPre", -- Alternatively, BufReadPre if we don't care about the empty file when starting with 'nvim'
	-- 	dependencies = { "nvim-tree/nvim-web-devicons", "SmiteshP/nvim-navic" },

	-- 	-- opts = {
	-- 	-- 	buf_modified_symbol = "●",
	-- 	-- },
	-- 	config = function()
	-- 		print(require("winbar").get_winbar({ icons = true, diagnostics = true }))
	-- 	end,
	-- },
}
