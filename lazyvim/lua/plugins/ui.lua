return {
  {
    "akinsho/bufferline.nvim",
    keys = {

      -- { "<S-w>", "<leader>bd", { "Delete buffer" } },
    },
  },
  -- buffer remove
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<S-w>", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
    },
  },
}
