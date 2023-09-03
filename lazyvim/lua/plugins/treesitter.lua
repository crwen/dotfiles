return {
  {
    "nvim-treesitter/nvim-treesitter",
    keys = {
      { "<c-space>", false },
      { "<c-space>", false },
      -- { "<bs>", desc = "Decrement selection", mode = "x" },
    },
    opts = {
      -- 启用代码高亮模块
      highlight = {
        -- 开启语法高亮
        enable = true,
        disable = {},
        -- 关闭 vim 的正则语法高亮
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      context_commentstring = { enable = true, enable_autocmd = false },
      textobjects = {
        swap = {
          enable = false,
        },
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["of"] = "@function.outer",
            ["if"] = "@function.inner",
            ["oc"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = false, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]]"] = "@function.outer",
            -- ["]["] = "@function.outer",
          },
          goto_next_end = {
            ["]["] = "@function.outer",
            -- ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[["] = "@function.outer",
            -- ["[]"] = "@function.outer",
          },
          goto_previous_end = {
            ["[]"] = "@function.outer",
            -- ["[]"] = "@class.outer",
          },
          lsp_interop = {
            enable = false,
            border = "none",
            peek_definition_code = {
              ["<leader>pf"] = "@function.outer",
              ["<leader>pF"] = "@class.outer",
            },
          },
        },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          -- init_selection = "<C-space>",
          init_selection = "<Enter>",
          -- node_incremental = "<C-space>",
          node_incremental = "<Enter>",
          scope_incremental = "<nop>",
          node_decremental = "<bs>",
        },
      },
    },
  },
}
