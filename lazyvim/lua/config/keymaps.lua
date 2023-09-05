-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
-- jj 跳出 insert 模式，进入normal模式
map("i", "jj", "<Esc>", opt) -- ,w 替换 esc + :w

map("i", "<leader>w", "<Esc>:w<cr>", opt)
map("n", "<leader>w", ":w<cr>", opt) -- 取消 s 默认功能
map("n", "<leader>q", ":q<cr>", opt) -- 取消 s 默认功能

-- windows
-- Ctrl + hjkl  窗口之间跳转
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)

-- 左右比例控制
-- <M-j/k/l/h> can't be used in tmux
map("n", "<M-Right>", ":vertical resize +2<CR>", opt)
-- map("n", "<M-l>", ":vertical resize +2<CR>", opt)
map("n", "<M-Left>", ":vertical resize -2<CR>", opt)
-- map("n", "<M-h>", ":vertical resize -2<CR>", opt)
-- 上下比例
map("n", "<M-Down>", ":resize +2<CR>", opt)
-- map("n", "<M-k>", ":resize +2<CR>", opt)
map("n", "<M-Up>", ":resize -2<CR>", opt) -- 等比例 map("n", "s=", "<C-w>=", opt)
-- map("n", "<M-j>", ":resize -2<CR>", opt) -- 等比例 map("n", "s=", "<C-w>=", opt)
--
-- 上下滚动浏览
map("n", "<C-u>", "6k", opt)
map("n", "<C-d>", "6j", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-f>", "12j", opt)
map("n", "<C-b>", "12k", opt)

-- 插件快捷键

-- map("n", "s", "<nop>", opt)
map("n", "<space>o", "<cmd>Lspsaga outline<cr>", opt)
map("n", "<M-d>", "<cmd>Lspsaga term_toggle<cr>", opt)
-- vim.keymap.set({ "n", "t", "<A-d>", "<cmd>Lspsaga term_toggle" })

-- local Util = require("lazyvim.util")
-- -- floating terminal
-- local lazyterm = function()
--   Util.float_term(nil, { cwd = Util.get_root(), border = "single" })
-- end
-- map("n", "<leader>ft", lazyterm, { desc = "Terminal (root dir)" })

-- vim.keymap.del("n", "<leader>ft")
-- vim.keymap.del("n", "<leader>fT")
-- vim.keymap.del("n", "<c-/>")
-- vim.keymap.del("n", "<c-_>")
