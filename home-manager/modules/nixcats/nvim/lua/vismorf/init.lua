require("lze").register_handlers(require("nixCatsUtils.lzUtils").for_cat)

-- require("vixmeow.cmp")
require("vixmeow.config")
require("vixmeow.format")
require("vixmeow.general")
-- require("vixmeow.lint")
-- require("vixmeow.lsp")

local file = vim.api.nvim_buf_get_name(0)
local is_dir = vim.fn.isdirectory(file) == 1

if is_dir then
	vim.cmd.cd(file)
end
