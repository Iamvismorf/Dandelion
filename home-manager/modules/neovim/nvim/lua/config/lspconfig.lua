local attach_keymaps = function(ev)
	local opts = { buffer = ev.buf, silent = true }
	local map = function(keys, func, desc)
		vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = desc, silent = true })
	end
	local tele = require("telescope.builtin")

	map("<leader>re", tele.lsp_references, "show definition, references")
	map("<leader>De", vim.lsp.buf.declaration, "go to declaration")

	map("<leader>de", tele.lsp_definitions, "show lsp definitions")

	map("<leader>i", tele.lsp_implementations, "show lsp implementations")
	map("<leader>t", tele.lsp_type_definitions, "show lsp type definitions")
	map("<leader>rn", vim.lsp.buf.rename, "smart rename")

	map("<leader>Di", tele.diagnostics, "show  diagnostics for file") -- pass 0 as bufnr
	map("<leader>di", vim.diagnostic.open_float, "show diagnostics for line")

	vim.keymap.set({ "n", "v" }, "<leader>ac", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
	map("T", vim.lsp.buf.hover, "show documentation for what is under cursor")
	map("<leader>rs", ":LspRestart<CR>", "mapping to restart lsp if necessary")
end
return {

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"saghen/blink.cmp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = attach_keymaps,
			})

			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local flags = {
				allow_incremental_sync = true,
				debounce_text_changes = 200,
			}
			vim.lsp.enable({
				"lua_ls",
				"ts_ls",
				"emmet_ls",
				"nixd",
			})
			vim.lsp.config("*", {
				capabilities = capabilities,
				flags = flags,
			})
			vim.lsp.config("nixd", {
				cmd = { "nixd" },
				settings = {
					nixd = {
						nixpkgs = {
							expr = "import <nixpkgs> { }",
						},
						formatting = {
							command = { "nixfmt" },
						},
						options = {
							nixos = {
								-- expr = '(builtins.getFlake "/home/vismorf/system").nixosConfigurations.nixos.options',
								expr = '(builtins.getFlake "/home/vismorf/system").nixosConfigurations.nixos.options',
							},
							home_manager = {
								-- expr = '(builtins.getFlake "/home/vismorf/system").homeConfigurations.vismorf.options',
								expr = '(builtins.getFlake "/home/vismorf/system").homeConfigurations.vismorf.options',
							},
						},
					},
				},
			})
			vim.lsp.config("lua_ls", {
				-- capabilities = capabilities,
				-- flags = flags,
				root_markers = {
					"lazy-lock.json",
					".luarc.json",
					".luarc.jsonc",
					".luacheckrc",
					".stylua.toml",
					"stylua.toml",
					"selene.toml",
					"selene.yml",
					".git",
				},
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						completion = {
							callSnippet = "Replace",
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})
			vim.lsp.config("emmet_ls", {
				-- capabilities = capabilities,
				-- flags = flags,
				filetypes = {
					"css",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"typescriptreact",
				},
			})
		end,
	},
}
