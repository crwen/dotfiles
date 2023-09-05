return {

  {
    "norcalli/nvim-colorizer.lua",
  },
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "moon",

      dim_inactive = true,
      -- https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_moon.lua
      on_highlights = function(highlights, colors)
        highlights.GitGutterChange = { fg = "#ffc777", bg = "#222436" }
        highlights.GitGutterAdd = { fg = "#627259" }
      end,
      -- on_colors = function(colors)
      --   colors.bg = "#191919"
      --   colors.bg_dark = "#101010"
      -- end,
    },
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      integrations = {
        alpha = true,
        cmp = true,
        flash = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mason = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        noice = true,
        notify = true,
        neotree = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    },
  },
}
