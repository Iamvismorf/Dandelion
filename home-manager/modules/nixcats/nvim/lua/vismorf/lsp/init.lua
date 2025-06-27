-- TODO: rewrite to native lsp without using lspconfig
return {
	"nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	after = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = require("vismorf.lsp.on_attach"),
		})
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		local flags = {
			allow_incremental_sync = true,
			debounce_text_changes = 200,
		}
		vim.lsp.enable({
			"lua_ls",
			"ts_ls",
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
							expr = '(builtins.getFlake "github:Iamvismorf/Dandelion").nixosConfigurations.nixos.options',
						},
						home_manager = {
							-- expr = '(builtins.getFlake "/home/vismorf/system").homeConfigurations.vismorf.options',
							expr = '(builtins.getFlake "github:Iamvismorf/Dandelion").homeConfigurations.vismorf.options',
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
	end,
}
