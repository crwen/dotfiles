-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local common = require("lsp.common")

local opts = {
  capabilities = common.capabilities,
  flags = common.flags,
  on_attach = function(client, bufnr)
    common.disableFormat(client)
    common.keyAttach(bufnr)
  end,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global globals = { "vim" },
        golbals = { 'vim' }
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        --library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  {
    debounce_text_changes = 150
  },
 -- on_attach = function(client, bufnr)
  -- 禁用格式化功能，交给专门插件插件处理
  -- client.resolved_capabilities.document_formatting = false
  --client.server_capabilities.document_formatting = false
  -- client.resolved_capabilities.document_range_formatting = false
  --client.server_capabilities.document_range_formatting = false

  --ocal function buf_set_keymap(...)
  --vim.api.nvim_buf_set_keymap(bufnr, ...)
  --end
  -- 绑定快捷键
  --require('keybindings').mapLSP(buf_set_keymap)
  -- 保存时自动格式化
  --vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
  --end,
  -- custom handler
  -- handlers = {
  --   ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  --     virtual_text = false,
  --     signs = true,
  --     underline = true,
  --     update_in_insert = false,
  --   }),
  -- },
}

return {
  on_setup = function(server)
    -- require("neodev").setup()
    server.setup(opts)
  end,
}
