return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          init_options = {
            fallbackFlags = { "-std=c++23" },
          },
        },
        eslint = {},
        bashls = {
          filetypes = { "sh", "zsh" },
        },
      },
    },
  },

  {
    "scalameta/nvim-metals",
    opts = function(_, metals_config)
      metals_config.init_options = vim.tbl_deep_extend("force", metals_config.init_options or {}, {
        icons = "unicode",
        disableColorOutput = false,
      })

      metals_config.settings = vim.tbl_deep_extend("force", metals_config.settings or {}, {
        serverVersion = "1.6.5",
        bloopVersion = "2.0.18",
        showImplicitArguments = true,
        excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
        testUserInterface = "Test Explorer",
        enableSemanticHighlighting = true,
        serverProperties = {
          "-Dmetals.status-bar=log-message",
          "-Dmetals.enable-best-effort=true",
        },
        inlayHints = {
          hintsInPatternMatch = { enable = true },
          typeParameters = { enable = true },
          inferredTypes = { enable = true },
          namedParameters = { enable = true },
          byNameParameters = { enable = true },
        },
      })

      local previous_on_attach = metals_config.on_attach
      metals_config.on_attach = function(client, bufnr)
        if previous_on_attach then
          previous_on_attach(client, bufnr)
        end

        client.server_capabilities.foldingRangeProvider = false

        local map = function(keys, command, desc)
          vim.keymap.set("n", keys, command, { buffer = bufnr, desc = desc })
        end

        map("gS", "<cmd>MetalsGotoSuperMethod<CR>", "Goto Super")
        map("<leader>mt", "<cmd>MetalsSelectTestSuite<CR>", "Run Test Suite")
        map("<leader>mc", "<cmd>MetalsSelectTestCase<CR>", "Run Test Case")
      end

      return metals_config
    end,
  },

  {
    "nvim-mini/mini.files",
    opts = {
      windows = { preview = false },
    },
    keys = {
      {
        "\\",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (Directory of Current File)",
      },
    },
  },

  {
    "folke/edgy.nvim",
    opts = function(_, opts)
      opts.keys = vim.tbl_extend("force", opts.keys or {}, {
        ["<c-Right>"] = nil,
        ["<c-Left>"] = nil,
        ["<c-Up>"] = nil,
        ["<c-Down>"] = nil,

        -- increase width
        ["<C-S-Right>"] = function(win)
          win:resize("width", 2)
        end,
        -- decrease width
        ["<C-S-Left>"] = function(win)
          win:resize("width", -2)
        end,
        -- increase height
        ["<C-S-Up>"] = function(win)
          win:resize("height", 2)
        end,
        -- decrease height
        ["<C-S-Down>"] = function(win)
          win:resize("height", -2)
        end,
      })
    end,
  },

  {
    -- See `:help gitsigns` to understand what the configuration keys do
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },

  {
    "ggandor/flit.nvim",
    enabled = false,
  },

  {
    "m00qek/baleia.nvim",
    config = function()
      local baleia = require("baleia").setup()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "dap-repl",
        callback = function()
          baleia.automatically(vim.api.nvim_get_current_buf())
        end,
      })
    end,
  },

  {
    "chrisgrieser/nvim-lsp-endhints",
    event = "LspAttach",
    opts = {},
  },
}
