return {
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
    lazy = false,
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
      colorscheme = function()
        local function is_dark()
          local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
          if handle then
            local result = handle:read("*a")
            handle:close()
            return result:match("Dark") ~= nil
          end
          return true
        end

        if is_dark() then
          -- vim.o.background = "dark"
          vim.cmd.colorscheme("nord")
        else
          -- vim.o.background = "light"
          vim.cmd.colorscheme("nord")
        end
      end,
    },
  },
}
