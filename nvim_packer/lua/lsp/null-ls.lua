local status, null_ls = pcall(require, "null-ls")
if not status then
  vim.notify("null-ls not found!") return
end

local formatting = null_ls.builtins.formatting
--local diagnostics = null_ls.builtins.diagnostics
--local code_actions = null_ls.builtins.code_actions


null_ls.setup({
  debug = false,
  sources = {
    -- Formatting ---------------------
    --  brew install shfmt
    formatting.shfmt,
    -- StyLua
    formatting.stylua,
    -- frontend
    formatting.prettier.with({
      -- 只比默认配置少了 markdown
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "yaml",
        "graphql",
        "go",
        "rust",
        "lua"
      },
      prefer_local = "node_modules/.bin",
    }),
    formatting.rustfmt,
    formatting.clang_format,
    formatting.gofmt,
    -- formatting.fixjson,
    -- python
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.rubocop,
  },
  -- 保存自动格式化
  on_attach = function(client)
    if client.server_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
  end,
})
