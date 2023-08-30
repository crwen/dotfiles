-- automatically saves the active session under ~/.local/state/nvim/sessions on exit
local status_ok, persistence = pcall(require, "persistence")
if not status_ok then
	vim.notify("folke/persistence.nvim not found!")
	return
end

local opts = {
	dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"), -- directory where session files are saved
	options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
	pre_save = nil, -- a function to call before saving the session
}

persistence.setup(opts)


-- restore the session for the current directory
vim.api.nvim_set_keymap("n", "<leader>rs", [[<cmd>lua require("persistence").load()<cr>]], {})

-- restore the last session
vim.api.nvim_set_keymap("n", "<leader>rl", [[<cmd>lua require("persistence").load({ last = true })<cr>]], {})

-- stop Persistence => session won't be saved on exit
vim.api.nvim_set_keymap("n", "<leader>rd", [[<cmd>lua require("persistence").stop()<cr>]], {})
