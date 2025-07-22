return {
  recommended = function()
    return LazyVim.extras.wants({
      ft = { "terraform", "hcl", "tf", "tfvars" },
      root = { ".terraform", ".tf", ".tfvars" },
    })
  end,

  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "terraform", "hcl" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        terraformls = {
          mason = false,
          cmd = { "terraform-ls", "serve" },
          filetypes = { "tf", "tfvars", "terraform", "terraform-vars" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("*.terraform", ".git")(fname)
          end,
        },
        tflint = {
          mason = false,
          cmd = { "tflint", "--langserver" },
          filetypes = { "tf", "tfvars", "terraform", "terraform-vars" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("*.terraform", ".git", ".tflint.hcl")(fname)
          end,
        },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        terraform = { "terraform_validate" },
        tf = { "terraform_validate" },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        hcl = { "packer_fmt" },
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
        ["terraform-vars"] = { "terraform_fmt" },
        ["tfvars"] = { "terraform_fmt" },
      },
    },
  },
}
