return {
  { "omar-s-ta/colorbuddy.nvim" },
  { "ellisonleao/gruvbox.nvim" },
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
  { "sainnhe/gruvbox-material" },
  {
    "EdenEast/nightfox.nvim",
    opts = {
      groups = {
        all = {
          LspInlayHint = { bg = "NONE" },
        },
      },
    },
  },
  { "vague2k/vague.nvim" },
  { "navarasu/onedark.nvim" },
  { "Mofiqul/vscode.nvim" },

  {
    "rose-pine/neovim",
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
