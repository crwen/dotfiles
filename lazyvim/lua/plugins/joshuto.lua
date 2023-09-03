return {
  "theniceboy/joshuto.nvim",
  very_lazy = true,
  cmd = "Joshuto",
  keys = {
    -- { "<space>e", "<leader>e", desc = "Explorer NeoTree (root dir)", remap = true },
    {
      "<leader>jo",
      function()
        require("joshuto").joshuto()
      end,
      desc = "Joshuto",
    },
  },
  config = function()
    -- let g:joshuto_floating_window_winblend = 0
    -- let g:joshuto_floating_window_scaling_factor = 1.0
    -- let g:joshuto_use_neovim_remote = 1 " for neovim-remote support
    vim.g.joshuto_floating_window_scaling_factor = 1.0
    vim.g.joshuto_use_neovim_remote = 1
    vim.g.joshuto_floating_window_winblend = 0
  end,
}
