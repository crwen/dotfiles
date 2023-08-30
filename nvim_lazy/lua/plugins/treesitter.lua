return {
	{ "HiPhish/nvim-ts-rainbow2", lazy = true },
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				"HiPhish/nvim-ts-rainbow2",
				init = function()
					-- PERF: no need to load the plugin, if we only need its queries for mini.ai
					local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
					local opts = require("lazy.core.plugin").values(plugin, "opts", false)
					local enabled = false
					if opts.textobjects then
						for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
							if opts.textobjects[mod] and opts.textobjects[mod].enable then
								enabled = true
								break
							end
						end
					end
					if not enabled then
						require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
					end
				end,
			},
		},
		keys = {
			{ "<c-space>", desc = "Increment selection" },
			{ "<bs>", desc = "Decrement selection", mode = "x" },
		},
		---@type TSConfig
		opts = {
			-- 启用代码高亮模块
			highlight = {
				-- 开启语法高亮
				enable = true,
				disable = {},
				-- 关闭 vim 的正则语法高亮
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			context_commentstring = { enable = true, enable_autocmd = false },
			ensure_installed = {
				"bash",
				"c",
				"go",
				"rust",
				"cpp",
				"python",
				-- "help",
				"html",
				"javascript",
				"json",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"query",
				"regex",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			},
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
			incremental_selection = {
				enable = true,
				keymaps = {
					-- init_selection = "<C-space>",
					init_selection = "<Enter>",
					-- node_incremental = "<C-space>",
					node_incremental = "<Enter>",
					scope_incremental = "<nop>",
					node_decremental = "<bs>",
				},
			},
		},
		---@param opts TSConfig
		config = function(_, opts)
			local rb = require("ts-rainbow")
			local rainbow = {
				enable = true,
				extended_mode = true,
				query = "rainbow-parens",
				strategy = rb.strategy["local"],
				latex = function()
					-- Disabled for very large files, global strategy for large files,
					-- local strategy otherwise
					if vim.fn.line("$") > 10000 then
						return nil
					elseif vim.fn.line("$") > 1000 then
						return rb.strategy["global"]
					end
					return rb.strategy["local"]
				end,
			}
			opts.rainbow = rainbow
			require("nvim-treesitter.configs").setup(opts)
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
			-- 默认不折叠
			vim.opt.foldlevel = 99
		end,
	},
}
