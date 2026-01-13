-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local function sphere_files()
  local sphere_dir = "~/development/scala/sphere-backend/"
  local opts = {
    dirs = { sphere_dir },
    hidden = true,
    ignored = false,
    follow = true,
  }
  local ok, snacks = pcall(require, "snacks")
  if not ok then
    vim.notify("Snacks is not available yet", vim.log.levels.WARN)
    return
  end
  snacks.picker.files(opts)
end

vim.api.nvim_create_user_command("Sphere", sphere_files, { desc = "search in sphere repo from any nvim" })
