-- vim.g.{name}: 全局变量
-- vim.b.{name}: 缓冲区变量
-- vim.w.{name}: 窗口变量
-- vim.bo.{option}: buffer-local 选项
-- vim.wo.{option}: window-local 选项

-- utf8
-- vim.g.encoding = "UTF-8"
-- vim.o.fileencoding = 'utf-8'
--
-- vim.wo.number = false
-- -- jkhl 移动时光标周围保留8行
-- vim.o.scrolloff = 4
-- vim.o.sidescrolloff = 4
--
-- -- 使用相对行号
-- vim.wo.number = true
-- -- vim.wo.relativenumber = true
--
-- -- 高亮所在行
-- vim.wo.cursorline = true
-- -- 显示左侧图标指示列
-- vim.wo.signcolumn = "yes"
-- -- 右侧参考线，超过表示代码太长了，考虑换行
-- -- vim.wo.colorcolumn = "80"
-- -- 缩进2个空格等于一个Tab
-- vim.o.tabstop = 2
-- vim.bo.tabstop = 2
-- vim.o.softtabstop = 2
-- vim.o.shiftround = true
-- -- >> << 时移动长度
-- vim.o.shiftwidth = 2
-- vim.bo.shiftwidth = 2
-- -- 空格替代tab
-- vim.o.expandtab = true
-- vim.bo.expandtab = true
-- -- 新行对齐当前行
-- vim.o.autoindent = true
-- vim.bo.autoindent = true
-- vim.o.smartindent = true
-- -- 搜索大小写不敏感，除非包含大写
-- vim.o.ignorecase = true
-- vim.o.smartcase = true
-- -- 搜索不要高亮
-- vim.o.hlsearch = false
-- -- 边输入边搜索
-- vim.o.incsearch = true
-- -- 命令行高为2，提供足够的显示空间
-- vim.o.cmdheight = 2
-- -- 当文件被外部程序修改时，自动加载
-- vim.o.autoread = true
-- vim.bo.autoread = true
-- -- 禁止折行
-- vim.wo.wrap = false
-- -- 光标在行首尾时<Left><Right>可以跳到下一行
-- vim.o.whichwrap = '<,>,[,]'
-- -- 允许隐藏被修改过的buffer
-- vim.o.hidden = true
-- -- 鼠标支持
-- vim.o.mouse = "a"
-- -- 禁止创建备份文件
-- vim.o.backup = false
-- vim.o.writebackup = false
-- vim.o.swapfile = false
-- -- smaller updatetime
-- vim.o.updatetime = 300
-- -- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
-- vim.o.timeoutlen = 500
-- -- split window 从下边和右边出现
-- vim.o.splitbelow = true
-- vim.o.splitright = true
-- -- 自动补全不自动选中
-- vim.g.completeopt = "menu,menuone,noselect,noinsert"
--
-- -- 样式
-- vim.o.background = "dark"
-- vim.o.termguicolors = true
-- vim.opt.termguicolors = true
-- -- 不可见字符的显示，这里只把空格显示为一个点
-- vim.o.list = true
-- vim.o.listchars = "space: ,tab:  "
-- --vim.opt.listchars = { space = '_', tab = '>~' }
-- -- 补全增强
-- vim.o.wildmenu = true
-- -- Dont' pass messages to |ins-completin menu|
-- vim.o.shortmess = vim.o.shortmess .. 'c'
-- -- 补全最多显示10行
-- vim.o.pumheight = 10
-- -- 永远显示 tabline
-- vim.o.showtabline = 2
-- -- 使用增强状态栏插件后不再需要 vim 的模式提示
-- vim.o.showmode = false


-- This file is automatically loaded by plugins.config

vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

local opt = vim.opt

opt.autowrite = true -- Enable auto write
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 0
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap

if vim.fn.has("nvim-0.9.0") == 1 then
	opt.splitkeep = "screen"
	opt.shortmess:append({ C = true })
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
