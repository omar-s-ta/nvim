-- Quint specification language support
-- Filetype detection, syntax highlighting, and LSP

vim.filetype.add({
  extension = {
    qnt = "quint",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "quint",
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
})

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Manual setup below since quint isn't in lspconfig
      },
      setup = {
        -- Prevent lspconfig from trying to set up a non-existent config
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "quint",
        callback = function(args)
          vim.lsp.start({
            name = "quint",
            cmd = { "quint-language-server", "--stdio" },
            root_dir = vim.fs.dirname(
              vim.fs.find({ ".git", "package.json" }, { upward = true, path = vim.fs.dirname(args.file) })[1]
            ) or vim.fn.getcwd(),
          })
        end,
      })
    end,
  },
}
