--[[  
--normal mode
    Old text                    Command         New text ~
    local str = H*ello          ysw"           local str = H"ello"                    
    local str = H*ello          ysiw"           local str = "Hello"                   
    require"nvim-surroun*d"     ysa")           require("nvim-surround")              around "
    char c = *x;                ysl'            char c = 'x';
    int a[] = *32;              yst;}           int a[] = {32}; 

    "hello world"               ds"             hello world                           delete
    'hello world'               cs'"            "hellow world"                        change

visual mode

local str = |some text|        S'               local str = 'some text'



]]

return {
  {
    { "echasnovski/mini.surround", enabled = false },
    -- keys = function(_, keys)
    --   -- Populate the keys based on the user's options
    --   local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
    --   local opts = require("lazy.core.plugin").values(plugin, "opts", false)
    --   local mappings = {
    --     { opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
    --     { opts.mappings.delete, desc = "Delete surrounding" },
    --     { opts.mappings.find, desc = "Find right surrounding" },
    --     { opts.mappings.find_left, desc = "Find left surrounding" },
    --     { opts.mappings.highlight, desc = "Highlight surrounding" },
    --     { opts.mappings.replace, desc = "Replace surrounding" },
    --     { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
    --   }
    --   mappings = vim.tbl_filter(function(m)
    --     return m[1] and #m[1] > 0
    --   end, mappings)
    --   return vim.list_extend(mappings, keys)
    -- end,
    -- opts = {
    --   mappings = {
    --     add = "gza", -- Add surrounding in Normal and Visual modes
    --     delete = "gzd", -- Delete surrounding
    --     find = "gzf", -- Find surrounding (to the right)
    --     find_left = "gzF", -- Find surrounding (to the left)
    --     highlight = "gzh", -- Highlight surrounding
    --     replace = "gzr", -- Replace surrounding
    --     update_n_lines = "gzn", -- Update `n_lines`
    --   },
    -- },
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {
      keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "ys",
        normal_cur = "yss",
        normal_line = "yS",
        normal_cur_line = "ySS",
        visual = "S",
        visual_line = "gS",
        delete = "ds",
        change = "cs",
        change_line = "cS",
      },
    },
    -- config = function()
    --   require("nvim-surround").setup({})
    -- end,
  },
}
