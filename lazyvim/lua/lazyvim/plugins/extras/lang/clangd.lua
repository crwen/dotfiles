return {

	-- add json to treesitter
	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	opts = function(_, opts)
	-- 		if type(opts.ensure_installed) == "table" then
	-- 			-- vim.list_extend(opts.ensure_installed, { "json", "json5", "jsonc" })
	-- 		end
	-- 	end,
	-- },

	-- correctly setup lspconfig
	{
		"neovim/nvim-lspconfig",
		-- dependencies = {
		-- 	"b0o/SchemaStore.nvim",
		-- 	version = false, -- last release is way too old
		-- },

		opts = function()
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
			capabilities.offsetEncoding = { "utf-16" }
			return {
				servers = {
					clangd = {
						capabilities = capabilities,
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
			}
		end,
	},
}
