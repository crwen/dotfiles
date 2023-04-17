return {
	-- lspconfig
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
			{ "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{
				"hrsh7th/cmp-nvim-lsp",
				cond = function()
					return require("lazyvim.util").has("nvim-cmp")
				end,
			},
		},
		---@class PluginLspOpts
		opts = {
			-- options for vim.diagnostic.config()
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = { spacing = 4, prefix = "●" },
				severity_sort = true,
			},
			-- Automatically format on save
			autoformat = true,
			-- options for vim.lsp.buf.format
			-- `bufnr` and `filter` is handled by the LazyVim formatter,
			-- but can be also overridden when specified
			format = {
				formatting_options = nil,
				timeout_ms = nil,
			},
			-- LSP Server Settings
			---@type lspconfig.options
			servers = {
				jsonls = {},
				lua_ls = {
					-- mason = false, -- set to false if you don't want this server to be installed with mason
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},
				clangd = {
					cmd = {
						"clangd",
						"--background-index", -- 后台建立索引，并持久化到disk
						"--clang-tidy", -- 开启clang-tidy
						-- 指定clang-tidy的检查参数， 摘抄自cmu15445. 全部参数可参考 https://clang.llvm.org/extra/clang-tidy/checks
						"--clang-tidy-checks=bugprone-*, clang-analyzer-*, google-*, modernize-*, performance-*, portability-*, readability-*, -bugprone-too-small-loop-variable, -clang-analyzer-cplusplus.NewDelete, -clang-analyzer-cplusplus.NewDeleteLeaks, -modernize-use-nodiscard, -modernize-avoid-c-arrays, -readability-magic-numbers, -bugprone-branch-clone, -bugprone-signed-char-misuse, -bugprone-unhandled-self-assignment, -clang-diagnostic-implicit-int-float-conversion, -modernize-use-auto, -modernize-use-trailing-return-type, -readability-convert-member-functions-to-static, -readability-make-member-function-const, -readability-qualified-auto, -readability-redundant-access-specifiers,",
						"--completion-style=detailed",
						"--cross-file-rename=true",
						"--header-insertion=iwyu",
						"--pch-storage=memory",
						-- 启用这项时，补全函数时，将会给参数提供占位符，键入后按 Tab 可以切换到下一占位符
						"--function-arg-placeholders=false",
						"--log=verbose",
						"--ranking-model=decision_forest",
						-- 输入建议中，已包含头文件的项与还未包含头文件的项会以圆点加以区分
						"--header-insertion-decorators",
						"-j=12",
						"--pretty",
					},
					filetypes = { "c", "cc", "cpp", "objc", "objcpp", "cuda", "proto" },
					single_file_support = true,
				},
			},
			-- you can do any additional lsp server setup here
			-- return true if you don't want this server to be setup with lspconfig
			---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
			setup = {
				-- example to setup with typescript.nvim
				-- tsserver = function(_, opts)
				--   require("typescript").setup({ server = opts })
				--   return true
				-- end,
				-- Specify * to use this function as a fallback for any server
				-- ["*"] = function(server, opts) end,
				-- clangd = function(_, opts)
				-- require("clangd").setup({ server = opts })
				-- return false
				-- end
			},
		},
		---@param opts PluginLspOpts
		config = function(_, opts)
			-- setup autoformat
			require("lazyvim.plugins.lsp.format").autoformat = opts.autoformat
			-- setup formatting and keymaps
			require("lazyvim.util").on_attach(function(client, buffer)
				require("lazyvim.plugins.lsp.format").on_attach(client, buffer)
				require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
			end)

			-- diagnostics
			for name, icon in pairs(require("lazyvim.config").icons.diagnostics) do
				name = "DiagnosticSign" .. name
				vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
			end
			vim.diagnostic.config(opts.diagnostics)

			local servers = opts.servers
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
			capabilities.offsetEncoding = { "utf-16" }

			local function setup(server)
				local server_opts = vim.tbl_deep_extend("force", {
					capabilities = vim.deepcopy(capabilities),
				}, servers[server] or {})

				if opts.setup[server] then
					if opts.setup[server](server, server_opts) then
						return
					end
				elseif opts.setup["*"] then
					if opts.setup["*"](server, server_opts) then
						return
					end
				end
				require("lspconfig")[server].setup(server_opts)
			end

			-- get all the servers that are available thourgh mason-lspconfig
			local have_mason, mlsp = pcall(require, "mason-lspconfig")
			local all_mslp_servers = {}
			if have_mason then
				all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
			end

			local ensure_installed = {} ---@type string[]
			for server, server_opts in pairs(servers) do
				if server_opts then
					server_opts = server_opts == true and {} or server_opts
					-- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
					if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
						setup(server)
					else
						ensure_installed[#ensure_installed + 1] = server
					end
				end
			end

			if have_mason then
				mlsp.setup({ ensure_installed = ensure_installed })
				mlsp.setup_handlers({ setup })
			end
		end,
	},

	-- formatters
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason.nvim" },
		opts = function()
			local nls = require("null-ls")
			return {
				root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
				sources = {
					nls.builtins.formatting.fish_indent,
					nls.builtins.diagnostics.fish,
					nls.builtins.formatting.stylua,
					nls.builtins.formatting.shfmt,
					nls.builtins.formatting.gofmt,
					nls.builtins.formatting.rustfmt,
					nls.builtins.formatting.clang_format,
					nls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
					nls.builtins.formatting.rubocop,
					-- nls.builtins.diagnostics.flake8,
				},
			}
		end,
	},

	-- cmdline tools and lsp servers
	{

		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		opts = {
			ensure_installed = {
				"stylua",
				"shfmt",
				"gopls",
				"clangd",
				"pyright",
				"rust-analyzer",
				-- "cmake",
				"taplo",
				-- "bashls",
				-- "flake8",
			},
		},
		---@param opts MasonSettings | {ensure_installed: string[]}
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			local function ensure_installed()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},
	{
		"tami5/lspsaga.nvim",
		opts = {
			debug = false,

			use_saga_diagnostic_sign = true,
			-- diagnostic sign
			error_sign = "",
			warn_sign = "",
			hint_sign = "",
			infor_sign = "",
			diagnostic_header_icon = "   ",
			-- code action title icon
			code_action_icon = " ",
			code_action_prompt = {
				enable = true,
				sign = true,
				sign_priority = 40,
				virtual_text = true,
			},
			finder_definition_icon = "  ",
			finder_reference_icon = "  ",
			max_preview_lines = 10,
			finder_action_keys = {
				-- open = "o",
				open = "<CR>",
				vsplit = "s",
				split = "i",
				-- quit = "q",
				quit = "<ESC>",
				scroll_down = "<C-f>",
				scroll_up = "<C-b>",
			},
			code_action_keys = {
				-- quit = "q",
				quit = "<ESC>",
				exec = "<CR>",
			},
			rename_action_keys = {
				-- quit = "<C-c>",
				quit = "<ESC>",
				exec = "<CR>",
			},
			definition_preview_icon = "  ",
			border_style = "single",
			rename_prompt_prefix = "➤",
			rename_output_qflist = {
				enable = false,
				auto_open_qflist = false,
			},
			server_filetype_map = {},
			diagnostic_prefix_format = "%d. ",
			diagnostic_message_format = "%m %c",
			highlight_prefix = false,
		},
	},
}
