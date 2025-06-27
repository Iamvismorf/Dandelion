local load_w_after = function(name)
	vim.cmd.packadd(name)
	vim.cmd.packadd(name .. "/after")
end
return {
	{
		"friendly-snippets",
		dep_of = { "blink.cmp" },
	},
	{
		"lspkind.nvim",
		dep_of = { "blink.cmp" },
		load = load_w_after,
	},
	{
		"blink.cmp",
		event = { "InsertEnter" },
		dep_of = { "nvim-lspconfig" },
		after = function()
			require("blink.cmp").setup({
				keymap = {
					preset = "enter",
					["<C-p>"] = {},
					["<C-n>"] = {},
					-- ["<cr>"] = { "select_and_accept" },

					["<C-k>"] = { "select_prev" },
					["<C-j>"] = { "select_next" },
				},
				cmdline = {
					completion = {
						menu = {
							auto_show = true,
						},
					},
				},

				appearance = {
					nerd_font_variant = "normal",
				},

				-- (Default) Only show the documentation popup when manually triggered
				completion = {

					list = {
						selection = {
							preselect = false,
						},
					},
					documentation = { auto_show = true },
					menu = {
						draw = {
							components = {
								kind_icon = {
									text = function(ctx)
										local icon = ctx.kind_icon
										if vim.tbl_contains({ "Path" }, ctx.source_name) then
											local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
											if dev_icon then
												icon = dev_icon
											end
										else
											icon = require("lspkind").symbolic(ctx.kind, {
												mode = "symbol",
											})
										end

										return icon .. ctx.icon_gap
									end,

									-- Optionally, use the highlight groups from nvim-web-devicons
									-- You can also add the same function for `kind.highlight` if you want to
									-- keep the highlight groups in sync with the icons.
									highlight = function(ctx)
										local hl = ctx.kind_hl
										if vim.tbl_contains({ "Path" }, ctx.source_name) then
											local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
											if dev_icon then
												hl = dev_hl
											end
										end
										return hl
									end,
								},
							},
						},
					},
				},

				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
				},
			})
		end,
	},
}
