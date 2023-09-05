return {
  {
    "folke/lazy.nvim",
    version = "*",
    keys = {

      {
        "<leader>ft",
        function()
          local Util = require("lazyvim.util")
          Util.float_term(nil, { border = "single", cwd = Util.get_root(), style = "minimal" })
        end,
        desc = "Terminal (root dir)",
      },
      {
        "<leader>ft",
        function()
          local Util = require("lazyvim.util")
          Util.float_term(nil, { border = "single", style = "minimal" })
        end,
        desc = "Terminal (cwd)",
      },
    },
  },
  { "LazyVim/LazyVim", priority = 10000, lazy = false, config = true, cond = true, version = "*" },
}
