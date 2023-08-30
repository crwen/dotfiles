local status, surround = pcall(require, "surround")
if not status then
  vim.notify("没有找到 surround")
  return
end

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
require "surround".setup {
  mappings_style = "surround",
  keymap("s", "S", "<Plug>SurroundAddVisual", opts),
}

--surround.setup({
--mappings_style = "surround",

--})
