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
          cmd = { "terraform-ls" },
          filetypes = { "tf", "tfvars", "terraform" },
        },
      },
    },
  },
  -- ensure terraform tools are installed
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "tflint" } },
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
