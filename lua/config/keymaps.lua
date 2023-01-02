vim.keymap.set("n", "<Esc>", function()
    vim.cmd.nohlsearch()
    vim.cmd.echo()
end)

vim.keymap.set("n", "<leader>li", function() vim.o.list = not vim.o.list end)

vim.keymap.set({ "i", "n" }, "<up>", "<Nop>")
vim.keymap.set({ "i", "n" }, "<down>", "<Nop>")
vim.keymap.set({ "i", "n" }, "<left>", "<Nop>")
vim.keymap.set({ "i", "n" }, "<right>", "<Nop>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split windows equal width and height" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current window" }) -- close current split window

vim.keymap.set("n", "<leader><Tab>", ":bn<CR>", { desc = "Next buffer" }) --  go to next buffer
vim.keymap.set("n", "<leader><s-Tab>", ":bp<CR>", { desc = "Previous buffer" }) --  go to previous buffer
vim.keymap.set("n", "<leader>q", ":bd<CR>", { desc = "Close buffer" }) --  go to previous buffer
