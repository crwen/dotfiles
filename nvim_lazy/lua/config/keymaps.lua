-- vim.api.nvim_set_keymap() 全局快捷键
-- vim.api.nvim_buf_set_keymap() Buffer 快捷键
-- vim.api.nvim_set_keymap('模式', '按键', '映射为', 'options') 模式: n/i/v/t/c     t:terminal  c:command option: { noremap = true, silent = true }

--vim.g.leetcode_browser = "chrome"
--vim.g.leetcode_china = 1

-- Remap leader key
-- vim.g.mapleader = ";"
-- vim.g.maplocalleader = ","

-- Shorten function name
-- local map = vim.api.nvim_set_keymap
-- local opt = { noremap = true, silent = true }

-- jj 跳出 insert 模式，进入normal模式
-- map("i", "jj", "<Esc>", opt) -- ,w 替换 esc + :w
-- map("i", "<leader>w", "<Esc>:w<cr>", opt)
-- map("n", "<leader>w", ":w<cr>", opt) -- 取消 s 默认功能
-- map("n", "<leader>q", ":q<cr>", opt) -- 取消 s 默认功能
-- map("n", "s", "", opt)
-- windows 分屏快捷键 map("n", "sv", ":vsp<CR>", opt) map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
-- map("n", "sc", "<C-w>c", opt)
-- 关闭其他
-- map("n", "so", "<C-w>o", opt)

-- windows
-- Ctrl + hjkl  窗口之间跳转
-- map("n", "<C-h>", "<C-w>h", opt)
-- map("n", "<C-j>", "<C-w>j", opt)
-- map("n", "<C-k>", "<C-w>k", opt)
-- map("n", "<C-l>", "<C-w>l", opt)
--
-- -- 左右比例控制
-- -- <M-j/k/l/h> can't be used in tmux
-- map("n", "<M-Right>", ":vertical resize +2<CR>", opt)
-- -- map("n", "<M-l>", ":vertical resize +2<CR>", opt)
-- map("n", "<M-Left>", ":vertical resize -2<CR>", opt)
-- -- map("n", "<M-h>", ":vertical resize -2<CR>", opt)
-- -- 上下比例
-- map("n", "<M-Down>", ":resize +2<CR>", opt)
-- -- map("n", "<M-k>", ":resize +2<CR>", opt)
-- map("n", "<M-Up>", ":resize -2<CR>", opt) -- 等比例 map("n", "s=", "<C-w>=", opt)
-- -- map("n", "<M-j>", ":resize -2<CR>", opt) -- 等比例 map("n", "s=", "<C-w>=", opt)
--
-- -- -- 上下滚动浏览
-- map("n", "<C-u>", "6k", opt)
-- map("n", "<C-d>", "6j", opt)
-- -- ctrl u / ctrl + d  只移动9行，默认移动半屏
-- map("n", "<C-f>", "12j", opt)
-- map("n", "<C-b>", "12k", opt)

-- 插件快捷键

-- bufferline
-- 左右Tab切换
-- map("n", "<Tab>h", ":BufferLineCyclePrev<CR>", opt)
-- map("n", "<Tab>l", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
-- map("n", "<Tab>w", ":Bdelete!<CR>", opt)
--map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
--map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
--map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope 文件搜索
-- 查找文件
-- map("n", "<leader>f", ":Telescope find_files<CR>", opt)
-- 全局搜索
-- map("n", "<leader>g", ":Telescope live_grep<CR>", opt)

-- local pluginKeys = {}
-- pluginKeys.telescopeList = {
-- 	i = {
-- 		-- 上下移动
-- 		["<C-j>"] = "move_selection_next",
-- 		["<C-k>"] = "move_selection_previous",
-- 		["<Down>"] = "move_selection_next",
-- 		["<Up>"] = "move_selection_previous",
-- 		--    -- 历史记录
-- 		["<C-n>"] = "cycle_history_next",
-- 		["<C-p>"] = "cycle_history_prev",
-- 		--    -- 关闭窗口
-- 		--    ["<C-c>"] = "close",
-- 		--    -- 预览窗口上下滚动
-- 		--    ["<C-u>"] = "preview_scrolling_up",
-- 		--    ["<C-d>"] = "preview_scrolling_down",
-- 	},
-- 	n = {
-- 		["j"] = "move_selection_next",
-- 		["k"] = "move_selection_previous",
-- 		["H"] = "move_to_top",
-- 		["gg"] = "move_to_top",
-- 		["M"] = "move_to_middle",
-- 		["L"] = "move_to_bottom",
-- 		["G"] = "move_to_bottom",
-- 	},
-- }

-- nvim-tree
--pluginKeys.nvimTreeList = require("keymap.nvim-tree")
-- alt + m 键打开关闭tree
-- map("n", "<leader>t", ":NvimTreeToggle<CR>", opt)
-- map("n", "<leader>l", ":NvimTreeFindFile<CR>", opt)

--map("n", "<leader>m<C-m>", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
-- pluginKeys.nvimTreeList = {
-- 	-- 打开文件或文件夹
-- 	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
-- 	-- 分屏打开文件
-- 	{ key = "v", action = "vsplit" },
-- 	{ key = "h", action = "split" },
-- 	-- 显示隐藏文件
-- 	{ key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
-- 	{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
-- 	-- 文件操作
-- 	{ key = "<F5>", action = "refresh" },
-- 	{ key = "a", action = "create" },
-- 	{ key = "d", action = "remove" },
-- 	{ key = "r", action = "rename" },
-- 	{ key = "x", action = "cut" },
-- 	{ key = "y", action = "copy" },
-- 	{ key = "p", action = "paste" },
-- 	{ key = "s", action = "system_open" },
-- }

--vim.keymap.set("n", "<Space>o", "<cmd>AerialToggle!<CR>")
--pluginKeys.outlineList = {
--	["<C-j>"] = "actions.down_and_scroll",
--	["<C-k>"] = "actions.up_and_scroll",
--}
-- lsp 回调函数快捷键设置

--pluginKeys.cmp = require("keymap.cmp")
-- nvim-cmp 自动补全
--[[ pluginKeys.cmp = function(cmp)
  return {
    -- 出现补全
    ["<M-p>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    -- 取消
    ["<M-q>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close()
    }),
    -- 上一个
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- 下一个
    ["<C-j>"] = cmp.mapping.select_next_item(),
    -- 确认
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    -- 如果窗口内容太多，可以滚动
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
  }
end
 ]]
-- 代码注释插件
-- see ./lua/plugin-config/comment.lua

-- nvim-dap
	-- 开始







-- This file is automatically loaded by lazyvim.plugins.config

local Util = require("util")

local function map(mode, lhs, rhs, opts)
	local keys = require("lazy.core.handler").handlers.keys
	---@cast keys LazyKeysHandler
	-- do not create the keymap if a lazy keys handler exists
	if not keys.active[keys.parse({ lhs, mode = mode }).id] then
		opts = opts or {}
		opts.silent = opts.silent ~= false
		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

-- jj 跳出 insert 模式，进入normal模式
map("i", "jj", "<Esc>", opt) -- ,w 替换 esc + :w
map("i", "<leader>w", "<Esc>:w<cr>", opt)
map("n", "<leader>w", ":w<cr>", opt) -- 取消 s 默认功能
map("n", "<leader>q", ":q<cr>", opt) -- 取消 s 默认功能

-- better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })


-- -- 上下滚动浏览
-- map("n", "<C-u>", "6k", opt)
-- map("n", "<C-d>", "6j", opt)
-- -- ctrl u / ctrl + d  只移动9行，默认移动半屏
-- map("n", "<C-f>", "12j", opt)
-- map("n", "<C-b>", "12k", opt)

-- Resize window using <ctrl> arrow keys
-- map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
-- map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
-- map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
-- map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
map("n", "<M-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<M-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<M-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<M-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
-- map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
-- map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
-- map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
-- map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
-- map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
map("n", "<M-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<M-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<M-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<M-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<M-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<M-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
if Util.has("bufferline.nvim") then
	map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
	map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
	map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
	map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
	map("n", "<S-w>", "<cmd>Bdelete!<cr>", { desc = "Delete buffer" })
else
	map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
	map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
	map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
	map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
end
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
	"n",
	"<leader>ur",
	"<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
	{ desc = "Redraw / clear hlsearch / diff update" }
)

map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- save file
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- lazy
map("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

if not Util.has("trouble.nvim") then
	map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
	map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })
end

-- stylua: ignore start

-- toggle options
map("n", "<leader>uf", require("plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
map("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
map("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
map("n", "<leader>ul", function() Util.toggle("relativenumber", true) Util.toggle("number") end, { desc = "Toggle Line Numbers" })
map("n", "<leader>ud", Util.toggle_diagnostics, { desc = "Toggle Diagnostics" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
map("n", "<leader>uc", function() Util.toggle("conceallevel", false, {0, conceallevel}) end, { desc = "Toggle Conceal" })

-- lazygit
map("n", "<leader>gg", function() Util.float_term({ "lazygit" }, { cwd = Util.get_root() }) end, { desc = "Lazygit (root dir)" })
map("n", "<leader>gG", function() Util.float_term({ "lazygit" }) end, { desc = "Lazygit (cwd)" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
  map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
end

-- floating terminal
map("n", "<leader>ft", function() Util.float_term(nil, { cwd = Util.get_root() }) end, { desc = "Terminal (root dir)" })
map("n", "<leader>fT", function() Util.float_term() end, { desc = "Terminal (cwd)" })
map("t", "<esc><esc>", "<c-\\><c-n>", {desc = "Enter Normal Mode"})

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
