local opts = { noremap = true, silent = true }
local map = vim.keymap.set
map("t", "<c-e>", "<C-\\><C-n>", opts) -- go to normal mode in terminal
map("n", "<M-t>", ":term<cr>", opts)

map("n", "<esc>", ":noh<cr>", opts)

map({ "n", "v", "x" }, "<leader>y", '"+y', opts)
map({ "n", "v", "x" }, "<leader>d", '"+d', opts)

map("n", "J", ":m .+1<CR>==") -- move line up(n)
map("n", "K", ":m .-2<CR>==") -- move line down(n)
map("v", "J", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "K", ":m '<-2<CR>gv=gv") -- move line down(v)

-- Navigate between windows using Ctrl + h/j/k/l
map({ "n", "v", "i" }, "<C-h>", "<esc><C-w>h", opts)
map({ "n", "v", "i" }, "<C-j>", "<esc><C-w>j", opts)
map({ "n", "v", "i" }, "<C-k>", "<esc><C-w>k", opts)
map({ "n", "v", "i" }, "<C-l>", "<esc><C-w>l", opts)

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-f>", "<C-f>zz")
map("n", "<C-b>", "<C-b>zz")

map("n", "H", "Hzz", opts)
map("n", "L", "Lzz", opts)

vim.cmd("cnoremap <c-k> <c-p>")
vim.cmd("cnoremap <c-j> <c-n>")

map({ "n", "v" }, "<leader>w", "<esc>:FlipVirtualText<cr>", {})
