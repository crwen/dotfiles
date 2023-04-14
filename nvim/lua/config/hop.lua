-- https://github.com/phaazon/hop.nvim
local status_ok, hop = pcall(require, "hop")
if not status_ok then
	vim.notify("hop not found!")
	return
end
hop.setup()

-- place this in one of your configuration file(s)
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('n', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('n', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('n', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, {remap=true})
vim.keymap.set('n', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, {remap=true})
-- place this in one of your configuration file(s)
-- enhance f motion
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"f",
-- 	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
-- 	{}
-- )
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"F",
-- 	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
-- 	{}
-- )
-- vim.api.nvim_set_keymap(
-- 	"o",
-- 	"f",
-- 	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
-- 	{}
-- )
-- vim.api.nvim_set_keymap(
-- 	"o",
-- 	"F",
-- 	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
-- 	{}
-- )
-- vim.api.nvim_set_keymap(
-- 	"",
-- 	"t",
-- 	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
-- 	{}
-- )
-- vim.api.nvim_set_keymap(
-- 	"",
-- 	"T",
-- 	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
-- 	{}
-- )

-- place this in one of your configuration file(s)
vim.api.nvim_set_keymap("n", "<leader><leader>w", "<cmd>HopWord<cr>", {})
vim.api.nvim_set_keymap("n", "<leader><leader>j", "<cmd>HopLine<cr>", {})
vim.api.nvim_set_keymap("n", "<leader><leader>k", "<cmd>HopLine<cr>", {})
vim.api.nvim_set_keymap("n", "<leader><leader>s", "<cmd>HopChar1<cr>", {})
vim.api.nvim_set_keymap("n", "<leader><leader>ss", "<cmd>HopChar2<cr>", {})
vim.api.nvim_set_keymap("n", "<leader><leader>/", "<cmd>HopPattern<cr>", {})
