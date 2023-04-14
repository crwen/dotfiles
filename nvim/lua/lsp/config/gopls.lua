local lspconfig = require("lspconfig")
util = require("lspconfig/util")

local common = require("lsp.common")
-- local opt = {
--   --capabilities = common.capabilities,
--   flags = common.flags,
--   cmd = { "gopls", "serve" },
--   filetypes = { "go", "gomod" },
--   root_dir = util.root_pattern("go.work", "go.mod", ".git"),
--   settings = {
--     gopls = {
--       analyses = {
--         unusedparams = true,
--       },
--       staticcheck = true,
--     },
--   },
--   on_attach = function(client, bufnr)
--     --common.disableFormat(client)
--     --common.keyAttach(bufnr)
--     -- Note: add in lsp client on-attach
--     require "lsp_signature".on_attach(signature_setup, bufnr)
--     local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--
--   end,
--   capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
-- }
--
--return {
--  on_setup = function(server)
-- require("neodev").setup()
--server.setup(opts)
--end,
--}
--
--
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").goimport()
	end,
	group = format_sync_grp,
})

-- lspconfig = require "lspconfig"
-- util = require "lspconfig/util"

--local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require("go").setup({
	-- other setups ....
	lsp_cfg = {
		capabilities = common.capabilities,
		-- other setups
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
	end,
})

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
return {
	on_setup = function(server)
		server.setup({
			cmd = { "gopls", "serve" },
			filetypes = { "go", "gomod" },
			root_dir = util.root_pattern("go.work", "go.mod", ".git"),
			settings = {
				gopls = {
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
					--ui = {
					--completion = {
					--usePlaceholders = true,
					--},
					--},
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
				},
			},
			capabilities = common.capabilities,
			flags = common.flags,
			on_attach = function(client, bufnr)
				common.disableFormat(client)
				common.keyAttach(bufnr)
				-- Note: add in lsp client on-attach
				require("lsp_signature").on_attach({
					bind = true, -- Thhis mandatory, otherwise border config won't work
					handler_opts = {
						border = "rounded",
					},
				}, bufnr)
			end,
		})
	end,
}
-- lspconfig.gopls.setup {
--   cmd = { "gopls", "serve" },
--   filetypes = { "go", "gomod" },
--   root_dir = util.root_pattern("go.work", "go.mod", ".git"),
--   settings = {
--     gopls = {
--       ui = {
--         completion = {
--           usePlaceholders = true,
--         },
--       },
--       analyses = {
--         unusedparams = true,
--       },
--       staticcheck = true,
--     },
--   },
--   capabilities = common.capabilities,
--   flags = common.flags,
--   on_attach = function(client, bufnr)
--     common.disableFormat(client)
--     common.keyAttach(bufnr)
--     -- Note: add in lsp client on-attach
--     require "lsp_signature".on_attach({
--       bind = true, -- Thhis mandatory, otherwise border config won't work
--       handler_opts = {
--         border = "rounded"
--       }
--     }, bufnr)
--   end,
-- }
