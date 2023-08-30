--[[
-- 'wild exact-match
-- ^music prefix-exact-match
-- .mp3$ huffix-exact-match
-- !fire inverse-exact-match; not
-- !^fire inverse-prefix-exact-match; not
-- !.mp3 inverse-suffix-exact-match
-- ^core go$ | rb$ | py$
--
--]]
local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("telescope not fount!")
  return
end

telescope.setup({
  defaults = {
    -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
    initial_mode = "insert",
    layout_strategy = "horizontal",
    layout_config = { width = 0.98, preview_cutoff = 1 },
    -- 窗口内快捷键
    mappings = require("keybindings").telescopeList,
  },
  pickers = {
    -- 内置 pickers 配置
    find_files = {
      -- 查找文件换皮肤，支持的参数有： dropdown, cursor, ivy
      theme = "dropdown",
      find_command = { "fd", "-H", "-I" } -- "-H" search hidden files, "-I" do not respect to gitignore
    }
  },
  extensions = {
    -- 扩展插件配置
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    },
    live_grep_raw = {
      auto_quoting = false, -- enable/disable auto-quoting
    },
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  },
  layout_config = {
    horizontal = {
      preview_cutofff = 0
    }
  }
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
