-- formatter
return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			typescript = { "prettier" },
			nix = { "alejandra" },
		},

		format_on_save = {
			async = false,
			timeout_ms = 500,
			lsp_fallback = true,
		},

		vim.keymap.set({ "n", "v" }, "<leader>=", function()
			require("conform").format({
				async = false,
				timeout_ms = 500,
				lsp_fallback = true,
			})
		end),
	},
}
