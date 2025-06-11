return {
  {
    dir = "~/development/sebres/third-party/obsidian.nvim",
    name = "obsidian.nvim",
  },
  {
    "obsidian.nvim",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/omar.abdelrahman.de@gmail.com - Google Drive/My Drive/obsidian-vault",
        },
      },
      completion = {
        blink_cmp = true,
        min_chars = 2,
      },
      new_notes_location = "notes_subdir",
      daily_notes = {
        folder = "00-09 Administration/01 Dailies",
        date_format = "%Y-%m-%d",
        alias_format = "%B %-d, %Y",
        default_tags = { "daily" },
      },
      mappings = {
        ["<leader>on"] = {
          action = ":ObsidianNew<CR>",
          opts = { noremap = true, silent = true, desc = "obsidian_new" },
        },
        ["<leader>os"] = {
          action = ":ObsidianSearch<CR>",
          opts = { noremap = true, silent = true, desc = "obsidian_search" },
        },
        ["<leader>oq"] = {
          action = ":ObsidianQuickSwitch<CR>",
          opts = { noremap = true, silent = true, desc = "obsidian_quick_switch" },
        },
        ["<leader>ob"] = {
          action = ":ObsidianBacklinks<CR>",
          opts = { noremap = true, silent = true, desc = "obsidian_back_links" },
        },
        ["<leader>ot"] = {
          action = ":ObsidianTemplate<CR>",
          opts = { noremap = true, silent = true, desc = "obsidian_template" },
        },
        ["<leader>op"] = {
          action = ":ObsidianPasteImg<CR>",
          opts = { noremap = true, silent = true, desc = "obsdian_paste_img" },
        },
        ["<leader>ogf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true, desc = "obsidian.util.gf_passthrough" },
        },
        ["<leader>och"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true, desc = "obsidian.util.toggle_checkbox" },
        },
        ["<leader>ocs"] = {
          action = function()
            return require("obsidian").util.smart_action()
          end,
          opts = { buffer = true, expr = true, desc = "obsidian.util.smart_action" },
        },
      },
      picker = {
        -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
        name = "mini.pick",
        -- Optional, configure key mappings for the picker. These are the defaults.
        -- Not all pickers support all mappings.
        note_mappings = {
          -- Create a new note from your query.
          new = "<C-x>",
          -- Insert a link to the selected note.
          insert_link = "<C-l>",
        },
        tag_mappings = {
          -- Add tag(s) to current note.
          tag_note = "<C-x>",
          -- Insert a tag at the current location.
          insert_tag = "<C-l>",
        },
      },

      -- Optional, configure additional syntax highlighting / extmarks.
      -- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
      ui = {
        enable = true, -- set to false to disable all additional syntax features
        update_debounce = 200, -- update delay after a text change (in milliseconds)
        max_file_length = 5000, -- disable UI features for files with more than this many lines
        -- Define how various check-boxes are displayed
        checkboxes = {
          -- The 'char' value has to be a single character, and the highlight groups are defined below.
          -- [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
          -- ["x"] = { char = "", hl_group = "ObsidianDone" },
          [">"] = { char = "", hl_group = "ObsidianRightArrow" },
          ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
          ["!"] = { char = "", hl_group = "ObsidianImportant" },
          -- Replace the above with this if you don't have a patched font:
          [" "] = { char = "☐", hl_group = "ObsidianTodo" },
          ["x"] = { char = "✔", hl_group = "ObsidianDone" },

          -- You can also add more custom ones...
        },
        -- Use bullet marks for non-checkbox lists.
        bullets = { char = "•", hl_group = "ObsidianBullet" },
        external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
        -- Replace the above with this if you don't have a patched font:
        -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
        reference_text = { hl_group = "ObsidianRefText" },
        highlight_text = { hl_group = "ObsidianHighlightText" },
        tags = { hl_group = "ObsidianTag" },
        block_ids = { hl_group = "ObsidianBlockID" },
        hl_groups = {
          -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
          ObsidianTodo = { bold = true, fg = "#f78c6c" },
          ObsidianDone = { bold = true, fg = "#89ddff" },
          ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
          ObsidianTilde = { bold = true, fg = "#ff5370" },
          ObsidianImportant = { bold = true, fg = "#d73128" },
          ObsidianBullet = { bold = true, fg = "#89ddff" },
          ObsidianRefText = { underline = true, fg = "#c792ea" },
          ObsidianExtLinkIcon = { fg = "#c792ea" },
          ObsidianTag = { italic = true, fg = "#89ddff" },
          ObsidianBlockID = { italic = true, fg = "#89ddff" },
          ObsidianHighlightText = { bg = "#75662e" },
        },
      },

      -- Specify how to handle attachments.
      attachments = {
        -- The default folder to place images in via `:ObsidianPasteImg`.
        -- If this is a relative path it will be interpreted as relative to the vault root.
        -- You can always override this per image by passing a full path to the command instead of just a filename.
        img_folder = "assets/imgs", -- This is the default

        -- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
        ---@return string
        img_name_func = function()
          -- Prefix image names with timestamp.
          return string.format("%s-", os.time())
        end,

        -- A function that determines the text to insert in the note when pasting an image.
        -- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
        -- This is the default implementation.
        ---@param client obsidian.Client
        ---@param path obsidian.Path the absolute path to the image file
        ---@return string
        img_text_func = function(client, path)
          path = client:vault_relative_path(path) or path
          return string.format("![%s](%s)", path.name, path)
        end,
      },
    },
  },
  {
    "saghen/blink.cmp",
    dependencies = {
      { dir = "~/development/sebres/third-party/obsidian.nvim" },
      { "saghen/blink.compat" },
    },
    opts = {
      sources = {
        compat = { "obsidian", "obsidian_new", "obsidian_tags" },
      },
    },
  },
}
