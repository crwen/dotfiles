
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }


-- See https://github.com/voldikss/vim-floaterm#keymaps
--let g:floaterm_keymap_new    = '<Space>'
map("n", "<Space>fn", ":FloatermNew<CR>", opt)
map("t", "<Space>fn", "<C-\\><C-n>:FloatermNew<CR>", opt)

map("n", "<Space>t", ":FloatermToggle<CR>", opt)
map("t", "<Space>t", "<C-\\><C-n>:FloatermToggle<CR>", opt)

map("n", "<Space>p", ":FloatermPrev<CR>", opt)
map("t", "<Space>p", "<C-\\><C-n>:FloatermPrev<CR>", opt)

map("n", "<Space>n", ":FloatermNext<CR>", opt)
map("t", "<Space>n", "<C-\\><C-n>:FloatermNext<CR>", opt)

map("n", "<Space>fi", ":FloatermFirst<CR>", opt)
map("t", "<Space>fi", "<C-\\><C-n>:FloatermFirst<CR>", opt)

map("n", "<Space>la", ":FloatermLast<CR>", opt)
map("t", "<Space>la", "<C-\\><C-n>:FloatermLast<CR>", opt)

map("n", "<Space>sh", ":FloatermShow<CR>", opt)
map("t", "<Space>sh", "<C-\\><C-n>:FloatermShow<CR>", opt)

map("n", "<Space>ki", ":FloatermKill<CR>", opt)
map("t", "<Space>ki", "<C-\\><C-n>:FloatermKill<CR>", opt)
--let g:floaterm_keymap_prev   = '<Space>p'
--let g:floaterm_keymap_next   = '<Space>n'
--let g:floaterm_keymap_toggle = '<Space>t'
--let g:floaterm_keymap_first   = '<Space>fi'
--let g:floaterm_keymap_last   = '<Space>la'
--let g:floaterm_keymap_kill   = '<Space>ki'


-- Highlights
--" Configuration example

--" Set floaterm window's background to black
--hi Floaterm guibg=black
--" Set floating window border line color to cyan, and background to orange
--hi FloatermBorder guibg=orange guifg=cyan


--" Set floaterm window foreground to gray once the cursor moves out from it
--hi FloatermNC guifg=gray
