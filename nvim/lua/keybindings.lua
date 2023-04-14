-- vim.api.nvim_set_keymap() 全局快捷键
-- vim.api.nvim_buf_set_keymap() Buffer 快捷键
-- vim.api.nvim_set_keymap('模式', '按键', '映射为', 'options') 模式: n/i/v/t/c     t:terminal  c:command option: { noremap = true, silent = true }

vim.g.leetcode_browser = "chrome"
vim.g.leetcode_china = 1

-- Remap leader key
vim.g.mapleader = ";"
vim.g.maplocalleader = ","

-- Shorten function name
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- jj 跳出 insert 模式，进入normal模式
map("i", "jj", "<Esc>", opt) -- ,w 替换 esc + :w
map("i", "<leader>w", "<Esc>:w<cr>", opt)
map("n", "<leader>w", ":w<cr>", opt) -- 取消 s 默认功能
map("n", "<leader>q", ":q<cr>", opt) -- 取消 s 默认功能
-- map("n", "s", "", opt)
-- windows 分屏快捷键 map("n", "sv", ":vsp<CR>", opt) map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
-- map("n", "sc", "<C-w>c", opt)
-- 关闭其他
-- map("n", "so", "<C-w>o", opt)

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

-- -- 上下滚动浏览
map("n", "<C-u>", "6k", opt)
map("n", "<C-d>", "6j", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-f>", "12j", opt)
map("n", "<C-b>", "12k", opt)

-- 插件快捷键

-- bufferline
-- 左右Tab切换
map("n", "<Tab>h", ":BufferLineCyclePrev<CR>", opt)
map("n", "<Tab>l", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "<Tab>w", ":Bdelete!<CR>", opt)
--map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
--map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
--map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope 文件搜索
-- 查找文件
map("n", "<leader>f", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<leader>g", ":Telescope live_grep<CR>", opt)

local pluginKeys = {}
pluginKeys.telescopeList = {
	i = {
		-- 上下移动
		["<C-j>"] = "move_selection_next",
		["<C-k>"] = "move_selection_previous",
		["<Down>"] = "move_selection_next",
		["<Up>"] = "move_selection_previous",
		--    -- 历史记录
		["<C-n>"] = "cycle_history_next",
		["<C-p>"] = "cycle_history_prev",
		--    -- 关闭窗口
		--    ["<C-c>"] = "close",
		--    -- 预览窗口上下滚动
		--    ["<C-u>"] = "preview_scrolling_up",
		--    ["<C-d>"] = "preview_scrolling_down",
	},
	n = {
		["j"] = "move_selection_next",
		["k"] = "move_selection_previous",
		["H"] = "move_to_top",
		["gg"] = "move_to_top",
		["M"] = "move_to_middle",
		["L"] = "move_to_bottom",
		["G"] = "move_to_bottom",
	},
}

-- nvim-tree
pluginKeys.nvimTreeList = require("keymap.nvim-tree")
-- alt + m 键打开关闭tree
--[[ map("n", "<leader>t", ":NvimTreeToggle<CR>", opt)
map("n", "<leader>l", ":NvimTreeFindFile<CR>", opt)

--map("n", "<leader>m<C-m>", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
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
 ]]
vim.keymap.set("n", "<Space>o", "<cmd>AerialToggle!<CR>")
pluginKeys.outlineList = {
	["<C-j>"] = "actions.down_and_scroll",
	["<C-k>"] = "actions.up_and_scroll",
}
-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
	-- rename
	mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
	--mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
	-- code action
	-- mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
	mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
	-- go xx
	mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
	-- mapbuf('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
	-- mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
	mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
	mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
	mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
	-- mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
	mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
	-- diagnostic
	-- mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
	-- mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
	--mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
	--mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
	mapbuf("n", "<Space>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opt)
	mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
	mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
	mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
	-- 没用到
	-- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
	-- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
	-- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
	-- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

pluginKeys.cmp = require("keymap.cmp")
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
pluginKeys.comment = {
	-- Normal 模式快捷键
	toggler = {
		line = "gcc", -- 行注释
		block = "gbc", -- 块注释
	},
	-- Visual 模式
	opleader = {
		line = "gc",
		bock = "gb",
	},
}

-- nvim-dap
pluginKeys.mapDAP = function()
	-- 开始
end

return pluginKeys
