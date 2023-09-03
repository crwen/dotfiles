return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = {
      -- { "<space>e", "<leader>e", desc = "Explorer NeoTree (root dir)", remap = true },
      { "<leader>e", false },
      { "<leader>E", false },
      {
        "<space>e",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      {
        "<space>E",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
    },
    opts = {
      sources = { "filesystem", "buffers", "git_status", "document_symbols" },
      -- source_selector = {
      --
      --   sources = {
      --     {
      --       source = "filesystem",
      --       display_name = " 󰉓 Files ",
      --     },
      --     {
      --       source = "buffers", -- string
      --       display_name = " 󰈚 Buffers ", -- string | nil
      --     },
      --     {
      --       source = "git_status", -- string
      --       display_name = " 󰊢 Git ", -- string | nil
      --     },
      --     "document_symbols",
      --   },
      -- },
      open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "Outline" },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = true,
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_hidden = true, -- only works on Windows for hidden files/directories
          hide_by_name = {
            "node_modules",
          },
          hide_by_pattern = { -- uses glob style patterns
            --"*.meta",
            --"*/src/*/tsconfig.json",
          },
          always_show = { -- remains visible even if other settings would normally hide it
            --".gitignored",
          },
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            --".DS_Store",
            --"thumbs.db"
          },
          never_show_by_pattern = { -- uses glob style patterns
            --".null-ls_*",
          },
        },
        window = {
          mappings = {
            ["<bs>"] = "navigate_up",
            ["h"] = "toggle_hidden",
            ["/"] = "fuzzy_finder",
            ["#"] = "fuzzy_sorter",
            ["D"] = "fuzzy_finder_directory",
            ["<c-x>"] = "clear_filter",
            ["[g"] = "prev_git_modified",
            ["]g"] = "next_git_modified",
          },
          fuzzy_finder_mappings = {
            -- define keymaps for filter popup window in fuzzy_finder_mode
            ["<C-j>"] = "move_cursor_down",
            ["<C-n>"] = "move_cursor_down",
            ["<C-k>"] = "move_cursor_up",
            ["<C-p>"] = "move_cursor_up",
          },
        },
        buffers = {
          follow_current_file = true, -- This will find and focus the file in the active buffer every
          -- time the current file is changed while the tree is open.
          group_empty_dirs = true, -- when true, empty folders will be grouped together
          show_unloaded = true,
          window = {
            mappings = {
              ["bd"] = "buffer_delete",
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
            },
          },
        },
        git_status = {
          window = {
            position = "float",
            mappings = {
              -- ["A"] = "git_add_all",
              ["A"] = "none",
              -- ["gu"] = "git_unstage_file",
              ["gu"] = "none",
              -- ["ga"] = "git_add_file",
              ["ga"] = "none",
              -- ["gr"] = "git_revert_file",
              ["gr"] = "none",
              -- ["gc"] = "git_commit",
              ["gc"] = "none",
              -- ["gp"] = "git_push",
              ["gp"] = "none",
              -- ["gg"] = "git_commit_and_push",
              ["gg"] = "none",
            },
          },
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        -- icon = {
        --   hightlight = "NeoTreeFileIcon",
        -- },
        -- name = {
        --   use_git_status_colors = true,
        --   hightlight = "NeoTreeFileName",
        -- },
        -- NeoTreeGitModified = "#e35e4f",
      },
    },
  },
}
