return function(ev)
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
