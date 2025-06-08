require("config.opts")
require("config.keymaps")
require("config.lazy")
require("config.diagnostics")
vim.cmd.colorscheme("yugen")
-- require("config.colors")

-- vim.api.nvim_create_augroup("cdpwd", { clear = true })

-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	group = "cdpwd",
-- 	callback = function()
-- 		vim.cmd("cd " .. vim.fn.getcwd())
-- 	end,
-- })
local file = vim.api.nvim_buf_get_name(0)
local is_dir = vim.fn.isdirectory(file) == 1

if is_dir then
	vim.cmd.cd(file)
end
