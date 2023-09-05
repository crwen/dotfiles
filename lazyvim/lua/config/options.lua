-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = ";"
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.termguicolors = true
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1

opt.autowrite = true -- Enable auto write
opt.clipboard = "unnamedplus" -- Sync with system clipboard

opt.foldmethod = "expr" -- Enable Folding
opt.foldexpr = "nvim_treesitter#foldexpr()"
-- -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
opt.foldlevel = 99 -- Not folding default

-- vim.cmd("hi NeoTreeGitModified guibg=#32302F")
-- vim.cmd("hi NeoTreeGitModified guibg=Green")
-- vim.cmd("hi FloatBorder guibg=#32302F")
