-- nvim-tree
-- local map = vim.api.nvim_set_keymap
-- local opt = { noremap = true, silent = true }
-- map("n", "<leader>t", ":NvimTreeToggle<CR>", opt)
-- map("n", "<leader>l", ":NvimTreeFindFile<CR>", opt)

--map("n", "<leader>m<C-m>", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
return {
  -- 打开文件或文件夹
  { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
  -- 分屏打开文件
  { key = "v",                              action = "vsplit" },
  { key = "h",                              action = "split" },
  -- 显示隐藏文件
  { key = "i",                              action = "toggle_custom" },   -- 对应 filters 中的 custom (node_modules)
  { key = ".",                              action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- 文件操作
  { key = "<F5>",                           action = "refresh" },
  { key = "a",                              action = "create" },
  { key = "d",                              action = "remove" },
  { key = "r",                              action = "rename" },
  { key = "x",                              action = "cut" },
  { key = "y",                              action = "copy" },
  { key = "p",                              action = "paste" },
  { key = "s",                              action = "system_open" },
}
