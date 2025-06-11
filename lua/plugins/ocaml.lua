return {
  recommended = function()
    return LazyVim.extras.wants({
      ft = { "ocaml", "ml", "mli", "cmi", "cmo", "cmx", "cma", "cmxa", "cmxs", "cmt", "cmti", "opam", "dune" },
      root = { "dune-project", "*.opam", "esy.json", ".merlin" },
    })
  end,
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "ocaml", "ocaml_interface" })
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ocamllsp = {
          mason = false,
          cmd = { "ocamllsp" },
          filetypes = {
            "ocaml",
            "ocaml.menhir",
            "ocaml.interface",
            "ocaml.ocamllex",
            "reason",
            "dune",
            "ml",
            "mli",
          },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(
              "*.opam",
              "dune-project",
              "dune-workspace",
              "esy.json",
              "package.json",
              ".merlin",
              ".git"
            )(fname)
          end,
        },
      },
    },
  },
}
