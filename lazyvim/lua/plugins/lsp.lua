return {

  {
    -- Ensure C/C++ debugger is installed
    "williamboman/mason.nvim",
    optional = true,
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "codelldb" })
        vim.list_extend(opts.ensure_installed, { "java-test", "java-debug-adapter" })
      end
    end,
  },
  -- LSP keymaps
  {
    "neovim/nvim-lspconfig",
    init = function()
      local M = require("lazyvim.plugins.lsp.keymaps")
      -- local keys = require("lazyvim.plugins.lsp.keymaps").get()
      local keys = M.get()

      -- change a keymap
      -- keys[#keys + 1] = { "gl", vim.diagnostic.open_float, desc = "Line Diagnostics" }
      keys[#keys + 1] = { "gl", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Line Diagnostics" }
      keys[#keys + 1] = { "gb", "<cmd>Lspsaga show_buf_diagnostics<cr>", desc = "Buffer Diagnostics" }
      keys[#keys + 1] = { "gw", "<cmd>Lspsaga show_workspace_diagnostics<cr>", desc = "Workspace Diagnostics" }

      -- keys[#keys + 1] = { "gh", vim.lsp.buf.hover, desc = "Hover" }
      keys[#keys + 1] = { "gh", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover Doc" }
      keys[#keys + 1] = { "gH", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek Definition" }
      keys[#keys + 1] = { "<leader>h", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" }
      -- keys[#keys + 1] = { "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next Diagnostic" }
      -- keys[#keys + 1] = { "gk", "[d", desc = "Prev Diagnostic" }
      -- keys[#keys + 1] = { "gk", M.diagnostic_goto(false), desc = "Prev Diagnostic" }
      keys[#keys + 1] = { "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Prev Diagnostic" }
      keys[#keys + 1] = { "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next Diagnostic" }
      -- keys[#keys + 1] = { "gj", M.diagnostic_goto(true), desc = "Next Diagnostic" }
      keys[#keys + 1] = { "ge", M.diagnostic_goto(true, "ERROR"), desc = "Next Error" }
      -- keys[#keys + 1] = { "<leader>h", vim.lsp.buf.hover }
      -- disable a keymap
      keys[#keys + 1] = { "K", false }
      keys[#keys + 1] = { "gK", false }
      -- add a keymap
      -- keys[#keys + 1] = { "H", "<cmd>echo 'hello'<cr>" }
    end,
  },
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "VeryLazy",
  --   keys = {
  --     {
  --       "<leader>h",
  --       function()
  --         require("lsp_signature").toggle_float_win()
  --       end,
  --       desc = "toggle signature",
  --     },
  --   },
  --   opts = {},
  --   -- config = function(_, opts)
  --   --   require("lsp_signature").setup(opts)
  --   -- end,
  -- },
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },

    -- keys = {
    --
    --   { "<space>o", "<cmd>Lspsaga outline<cr>", desc = "Outline" },
    -- },
    opts = {
      symbol_in_winbar = {
        enable = false, --  must enable, or outline would not work
      },
      outline = {
        win_position = "right",
        win_width = 50,
        auto_preview = true, -- auto preview when cursor moved in outline window
        detail = true, -- show detail
        auto_close = true, -- auto close itself when outline window is last window
        close_after_jump = false,
        layout = "normal", -- float or normal, when is float above options will ignored
        -- layout = "float", -- float or normal, when is float above options will ignored
        max_height = 0.6, -- height of outline float layout
        left_width = 0.3, -- width of outline float layout left window
        keys = {
          toggle_or_jump = "<cr>",
          quit = "q",
          -- jump = 'e'
        },
      },
    },
    -- config = function(_, opts)
    --   local saga = require("cmp")
    --   saga.config.sources(vim.list_extend(opts.outline, { { keys = { toggle_or_jump = "<cr>" } } }))
    --
    --   local m = { noremap = true, nowait = true }
    --   -- opts.symbol_in_winbar.enable = true
    --   vim.keymap.set("n", "<space>o", "<cmd>Lspsaga outline<cr>", m)
    --   -- vim.keymap.set("n", "<cr>", "<cmd>Lspsaga outline<cr>", m)
    -- end,
    -- config = function()
    --   require("lspsaga").setup({})
    -- end,
  },
}
