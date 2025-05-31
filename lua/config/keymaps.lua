-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page" })
map("n", "gg", "gg0", { desc = "Move to the first position in current file" })
map("v", "gg", "gg0", { desc = "Move to the first position in current file" })
map("n", "G", "G$", { desc = "Move to the last position in the current file" })
map("v", "G", "G$", { desc = "Move to the last position in the current file" })

--  Resize window using <ctrl><shift> arrow keys
--  Overrides default keymaps
map("n", "<C-S-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

--  Disable arrow keys in normal mode
map("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
map("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
map("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
map("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
-- This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
