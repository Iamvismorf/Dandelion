-- vim.api.nvim_create_autocmd("BufWinEnter", {
-- 	pattern = "*",
-- 	callback = function(event)
-- 		if vim.bo[event.buf].filetype == "help" then
-- 			vim.bo[event.buf].buflisted = true
-- 			vim.cmd.only()
-- 		end
-- 	end,
-- })
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.winborder = "single"

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.expandtab = true
vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 3

vim.opt.swapfile = false
vim.opt.backup = false

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "neo-tree" },
	callback = function()
		require("ufo").detach()
		vim.opt_local.foldenable = false
		vim.opt_local.foldcolumn = "0"
	end,
})
