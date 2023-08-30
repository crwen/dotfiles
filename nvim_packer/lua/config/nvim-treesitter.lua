local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	vim.notify("nvim-treesitter not found!")
	return
end
local status_ts, rainbow = pcall(require, "ts-rainbow")
if not status_ts then
	vim.notify("ts-rainbow not found!")
	return
end

treesitter.setup({
	-- 安装 language parser
	-- :TSInstallInfo 命令查看支持的语言
	-- 自动安装
	ensure_installed = {
		"json",
		"html",
		"css",
		"vim",
		"lua",
		"javascript",
		"typescript",
		"tsx",
		"vue",
		"lua",
		"go",
		"rust",
		"cpp",
		"java",
		"python",
		"yaml",
		"markdown",
	},
	-- 启用代码高亮模块
	highlight = {
		-- 开启语法高亮
		enable = true,
		disable = {},
		-- 关闭 vim 的正则语法高亮
		additional_vim_regex_highlighting = false,
	},
	-- textobjects extension settings
	-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	textobjects = {
		swap = {
			enable = false,
		},
		select = {
			enable = true,
			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = false, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]]"] = "@function.outer",
				-- ["]["] = "@function.outer",
			},
			goto_next_end = {
				["]["] = "@function.outer",
				-- ["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[["] = "@function.outer",
				-- ["[]"] = "@function.outer",
			},
			goto_previous_end = {
				["[]"] = "@function.outer",
				-- ["[]"] = "@class.outer",
			},
		},
		lsp_interop = {
			enable = false,
			border = "none",
			peek_definition_code = {
				["<leader>pf"] = "@function.outer",
				["<leader>pF"] = "@class.outer",
			},
		},
	},
	playground = {
		enable = false,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
	rainbow = {
		enable = true,
		-- list of languages you want to disable the plugin for
		-- disable = { "jsx", "cpp" },
		-- Which query to use for finding delimiters
		query = "rainbow-parens",
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
		-- Highlight the entire buffer all at once
		-- strategy = rainbow.strategy.global,
		-- strategy = rainbow.strategy.global,

		strategy = {
			-- Use global strategy by default
			-- rainbow.strategy['global'],
			rainbow.strategy["local"],
			-- Use local for HTML
			-- html = rainbow.strategy['local'],
			-- Pick the strategy for LaTeX dynamically based on the buffer size
			latex = function()
				-- Disabled for very large files, global strategy for large files,
				-- local strategy otherwise
				if vim.fn.line("$") > 10000 then
					return nil
				elseif vim.fn.line("$") > 1000 then
					return rainbow.strategy["global"]
				end
				return rainbow.strategy["local"]
			end,
		},
	},
	-- 启用增量选择模块
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			node_decremental = "<BS>",
			scope_incremental = "<TAB>",
		},
	},
})

-- 开启 Folding 模块
--vim.opt.foldmethod = "expr"
vim.opt.foldmethod = "indent"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99
