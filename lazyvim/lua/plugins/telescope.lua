local Util = require("lazyvim.util")

return {
  -- search/replace in multiple files
  --[[
  -- 'wild exact-match
  -- ^music prefix-exact-match
  -- .mp3$ suffix-exact-match
  -- !fire inverse-exact-match; not
  -- !^fire inverse-prefix-exact-match; not
  -- !.mp3 inverse-suffix-exact-match
  -- ^core go$ | rb$ | py$
  --
  --]]
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  { "nvim-telescope/telescope-live-grep-args.nvim" },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    config = function()
      -- To get fzf loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("fzf")
    end,
  },
  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    keys = {
      { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      -- { "<leader>fg", "<leader>/", desc = "Find in Files (Grep)" },
      { "<leader>fg", Util.telescope("live_grep"), desc = "Find in Files (Grep)" },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      -- { "<leader><space>", Util.telescope("files"), desc = "Find Files (root dir)" },
      -- find
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>ff", Util.telescope("files"), desc = "Find Files (root dir)" },
      { "<leader>fF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
    },
    opts = {
      defaults = {
        -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
        initial_mode = "insert",
        layout_strategy = "horizontal",
        layout_config = { width = 0.98, preview_cutoff = 1 },
        prompt_prefix = " ",
        selection_caret = " ",
        mappings = {
          i = {
            ["<c-t>"] = function(...)
              return require("trouble.providers.telescope").open_with_trouble(...)
            end,
            ["<a-t>"] = function(...)
              return require("trouble.providers.telescope").open_selected_with_trouble(...)
            end,
            ["<a-i>"] = function()
              Util.telescope("find_files", { no_ignore = true })()
            end,
            ["<a-h>"] = function()
              Util.telescope("find_files", { hidden = true })()
            end,
            ["<C-Down>"] = function(...)
              return require("telescope.actions").cycle_history_next(...)
            end,
            ["<C-Up>"] = function(...)
              return require("telescope.actions").cycle_history_prev(...)
            end,
            ["<C-f>"] = function(...)
              return require("telescope.actions").preview_scrolling_down(...)
            end,
            ["<C-b>"] = function(...)
              return require("telescope.actions").preview_scrolling_up(...)
            end,
          },
          n = {
            ["q"] = function(...)
              return require("telescope.actions").close(...)
            end,
          },
        },
      },
      pickers = {
        -- 内置 pickers 配置
        find_files = {
          -- 查找文件换皮肤，支持的参数有： dropdown, cursor, ivy
          -- theme = "dropdown",
          find_command = { "fd", "-H", "-I" }, -- "-H" search hidden files, "-I" do not respect to gitignore
        },
      },
      extensions = {
        -- 扩展插件配置
        ["ui-select"] = {
          -- require("telescope.themes").get_dropdown({
          -- even more opts
          -- }),
        },
        live_grep_raw = {
          auto_quoting = false, -- enable/disable auto-quoting
        },
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      },
      layout_config = {
        horizontal = {
          preview_cutofff = 0,
        },
      },
    },
  },
}
