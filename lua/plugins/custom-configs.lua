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
        metals = {
          keys = {
            { "gS", "<cmd>MetalsGotoSuperMethod<CR>", desc = "Goto Super" },
            { "<leader>mt", "<cmd>MetalsSelectTestSuite<CR>", desc = "Run Test Suite" },
            { "<leader>mc", "<cmd>MetalsSelectTestCase<CR>", desc = "Run Test Case" },
          },
          settings = {
            showImplicitArguments = true,
            excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
            -- showImplicitConversionsAndClasses = true,
            -- showInferredType = true,
            testUserInterface = "Test Explorer",
            enableSemanticHighlighting = true,
            serverProperties = {
              "-Dmetals.allow-multiline-string-formatting=off",
              -- "-Dmetals.icons=unicode",
              "-Dmetals.status-bar=log-message",
              "-Dmetals.enable-best-effort=true",
            },
          },
        },
      },
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
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
