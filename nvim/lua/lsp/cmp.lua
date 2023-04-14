local cmp = require("cmp")

local mappings = {
    -- 出现补全
    ["<C-p>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    -- 取消
    ["<C-,>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close()
    }),
    -- 上一个
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- 下一个
    ["<C-j>"] = cmp.mapping.select_next_item(),
    -- 确认
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    -- 如果窗口内容太多，可以滚动
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
  }

cmp.setup({
	-- 指定 snippet 引擎
	snippet = {
		expand = function(args)
			-- For `vsnip` users.
			vim.fn["vsnip#anonymous"](args.body)

			-- For `luasnip` users.
			-- require('luasnip').lsp_expand(args.body)

			-- For `ultisnips` users.
			-- vim.fn["UltiSnips#Anon"](args.body)

			-- For `snippy` users.
			-- require'snippy'.expand_snippet(args.body)
		end,
	},
	-- 补全源
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		-- For vsnip users.
		{ name = "vsnip" },

		-- For luasnip users.
		-- { name = "luasnip" },
		{ name = "treesitter" },

		--For ultisnips users.
		-- { name = 'ultisnips' },

		-- -- For snippy users.
		-- { name = 'snippy' },
	}, {
		{ name = "buffer" },
		{ name = "path" },
	}),
	-- 快捷键设置
	-- mapping = require("keybindings").cmp(cmp),
	mapping = mappings,
	-- 使用lspkind-nvim显示类型图标 (新增)
	formatting = require("lsp.ui").formatting,
})

-- / 查找模式使用 buffer 源
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- : 命令行模式中使用 path 和 cmdline 源.
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
