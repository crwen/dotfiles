local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  vim.notify("nvim-tree not found!")
  return
end

-- nvim-tree
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
map("n", "<leader>t", ":NvimTreeToggle<CR>", opt)
map("n", "<leader>l", ":NvimTreeFindFile<CR>", opt)

--map("n", "<leader>m<C-m>", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
-- local list_keys = { -- 打开文件或文件夹
--   { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
--   -- 分屏打开文件
--   { key = "v",                              action = "vsplit" },
--   { key = "h",                              action = "split" },
--   -- 显示隐藏文件
--   { key = "i",                              action = "toggle_custom" },   -- 对应 filters 中的 custom (node_modules)
--   { key = ".",                              action = "toggle_dotfiles" }, -- Hide (dotfiles)
--   -- 文件操作
--   { key = "<F5>",                           action = "refresh" },
--   { key = "a",                              action = "create" },
--   { key = "d",                              action = "remove" },
--   { key = "r",                              action = "rename" },
--   { key = "x",                              action = "cut" },
--   { key = "y",                              action = "copy" },
--   { key = "p",                              action = "paste" },
--   { key = "s",                              action = "system_open" },
-- }
--[[ vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "S",
    unmerged = "",
    renamed = "➜",
    deleted = "",
    untracked = "U",
    ignored = "◌",
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
  },
} ]]
-- 列表操作快捷键
local list_keys = require('keybindings').nvimTreeList
nvim_tree.setup({
  -- 显示 git 状态图标
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  -- project plugin 需要这样设置
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  -- 隐藏 .文件 和 node_modules 文件夹
  filters = {
    dotfiles = true,
    custom = { 'node_modules' },
  },
  view = {
    -- 宽度
    width = 40,
    -- 也可以 'right'
    side = 'left',
    -- 隐藏根目录
    hide_root_folder = false,
    -- 自定义列表中快捷键
    mappings = {
      custom_only = false,
      list = list_keys,
    },
    -- 不显示行数
    number = false,
    relativenumber = false,
    -- 显示图标
    signcolumn = 'yes',
  },
  actions = {
    open_file = {
      -- 首次打开大小适配
      resize_window = true,
      -- 打开文件时关闭
      quit_on_open = true,
    },
  },
  -- wsl install -g wsl-open
  -- https://github.com/4U6U57/wsl-open/
  system_open = {
    -- cmd = 'wsl-open', -- mac 直接设置为 open
    cmd = 'open', -- mac 直接设置为 open
  },
})
-- 自动关闭
vim.cmd([[
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
