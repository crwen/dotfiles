return {

  {
    "L3MON4D3/LuaSnip",
    -- keys = function()
    --   return {}
    -- end,
    opts = function(_, _)
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { "./snippets/" },
      })
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      {"s",  mode = { "n", "o", "x" }, false},
      {"S",  mode = { "n", "o", "x" }, false},
      -- {"S", "<nop>"},
      -- {"s",false},
      -- {"S",false},
      -- { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
      { "\\",mode = {"n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
      -- { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "tt", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
}
