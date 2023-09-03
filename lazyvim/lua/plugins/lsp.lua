return {
  -- LSP keymaps
  {
    "neovim/nvim-lspconfig",
    init = function()
      local M = require("lazyvim.plugins.lsp.keymaps")
      -- local keys = require("lazyvim.plugins.lsp.keymaps").get()
      local keys = M.get()

      -- change a keymap
      keys[#keys + 1] = { "gl", vim.diagnostic.open_float, desc = "Line Diagnostics" }
      keys[#keys + 1] = { "gh", vim.lsp.buf.hover, desc = "Hover" }
      keys[#keys + 1] = { "<leader>h", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" }
      -- keys[#keys + 1] = { "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next Diagnostic" }
      -- keys[#keys + 1] = { "gk", "[d", desc = "Prev Diagnostic" }
      keys[#keys + 1] = { "gk", M.diagnostic_goto(false), desc = "Prev Diagnostic" }
      keys[#keys + 1] = { "gj", M.diagnostic_goto(true), desc = "Next Diagnostic" }
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
}
