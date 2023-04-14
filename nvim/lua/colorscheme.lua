-- local colorscheme = "catppuccin"
-- local colorscheme = "catppuccin-latte"
-- local colorscheme = "darkplus"
-- local colorscheme = "github_light"
--local colorscheme = "tokyodark"
-- local colorscheme = "tokyonight-storm"
-- local colorscheme = "tokyonight-night"
-- local colorscheme = "tokyonight-moon"
-- local colorscheme = "PaperColor"
local colorscheme = "tokyonight-day"
-- local colorscheme = "everforest"
-- local colorscheme = "edge"
-- local colorscheme = "rose-pine"
    -- use('tempus-themes')
    -- use('sainnhe/edge')
-- .. 用于连接字符串
-- :colorscheme xxx
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

-- vim.g.tokyonight_style = "day"
-- vim.o.background = "light"
