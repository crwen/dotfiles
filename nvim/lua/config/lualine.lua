
-- 如果找不到lualine 组件，就不继续执行
local status, lualine = pcall(require, "lualine")
if not status then
    vim.notify("lualine not found!")
  return
end

lualine.setup({
  -- 设置样式
  options = {
    -- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
    theme = "tokyonight",
    -- theme = "edge",
    -- theme = "rose-pine",
    -- theme = "github_light",
    -- theme = "tokyodark",
    -- theme = "auto",
    -- theme = "gruvbox_light",
    -- 分段分隔符
    component_separators = { left = "|", right = "|" },
    -- 分段中的组件分隔符
    -- https://github.com/ryanoasis/powerline-extra-symbols
    section_separators = { left = " ", right = "" },
  },
  -- 设置 lualinee 支持的扩展
  -- https://github.com/nvim-lualine/lualine.nvim#extensions
  -- extensions = { "nvim-tree", "toggleterm" },
  extensions = { "nvim-tree" },
  -- 设置不同分段 |a | b | c                         x | y | z |
  sections = {
    lualine_c = {
      "filename",
      {
        "lsp_progress",
        -- spinner_symbols = { " ", " ", " ", " ", " ", " " },
      },
    },
    lualine_x = {
      "filesize",
      {
        "fileformat",
        -- symbols = {
        --   unix = '', -- e712
        --   dos = '', -- e70f
        --   mac = '', -- e711
        -- },
        symbols = {
          unix = "LF",
          dos = "CRLF",
          mac = "CR",
        },
      },
      "encoding",
      "filetype",
    },
  },
})

