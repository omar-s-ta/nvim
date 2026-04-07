return {
  { "omar-s-ta/colorbuddy.nvim", lazy = true },
  { "ellisonleao/gruvbox.nvim", lazy = true },
  {
    "arcticicestudio/nord-vim",
    config = function()
      local set_nord_highlights = function()
        vim.api.nvim_set_hl(0, "@keyword.function", { fg = "#B48EAD" })
        vim.api.nvim_set_hl(0, "Keyword", { fg = "#B48EAD" })
        vim.api.nvim_set_hl(0, "LspInlayHint", {
          fg = "#4C566A",
          bg = "NONE",
          italic = false,
          bold = false,
          blend = 0,
        })
      end

      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "nord",
        callback = set_nord_highlights,
      })

      if vim.g.colors_name == "nord" then
        set_nord_highlights()
      end
    end,
  },
  { "sainnhe/gruvbox-material", lazy = true },
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    opts = {
      groups = {
        all = {
          LspInlayHint = { bg = "NONE" },
        },
      },
    },
  },
  { "vague2k/vague.nvim", lazy = true },
  { "navarasu/onedark.nvim", lazy = true },
  { "Mofiqul/vscode.nvim", lazy = true },

  {
    "rose-pine/neovim",
    lazy = true,
    main = "rose-pine",
    opts = {
      styles = {
        italic = false,
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },
}
