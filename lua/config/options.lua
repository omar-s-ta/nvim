-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.have_nerd_font = true

-- python opts
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff"

local opt = vim.opt
--opt.breakindent = true
opt.softtabstop = 2
opt.scrolloff = 10
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.o.winborder = "rounded"
