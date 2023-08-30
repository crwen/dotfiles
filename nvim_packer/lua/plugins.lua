--local fn = vim.fn

-- Automatically install packer
--local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
--if fn.empty(fn.glob(install_path)) > 0 then
--PACKER_BOOTSTRAP = fn.system {
-- "git",
--"clone",
--"--depth",
--"1",
--"https://github.com/wbthomason/packer.nvim",
--install_path
--}
--vim.cmd [[packadd packer.nvim]]
--end

-- Autocommand that reloads neovim whenever you sanve the plugins.lua file
--vim.cmd [[
--augroup packer_user_config
--autocmd!
--autocmd BufWritePost plugins.lua soure <afile> | PackerSync
--augroup end
--]]

local packer = require("packer")
packer.startup({
	function(use) -- Packer 可以管理自己本身
		use("wbthomason/packer.nvim")
		-- plugins...

		-- Is using a standard Neovim install, i.e. built from source or using a
		-- provided appimage.
		use("dstein64/vim-startuptime")
		use("lewis6991/impatient.nvim")
		use("rcarriga/nvim-notify")
		-- dashboard-nvim
		use("glepnir/dashboard-nvim")
		-- use 'mhinz/vim-startify'

		-- -- nvim-tree  文件树
		use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
		-- 文件大纲
		use("stevearc/aerial.nvim")
		-- bufferline buffer 标签栏
		use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })

		-- lualine 底部显示栏
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
		use("arkav/lualine-lsp-progress")
		-- telescope 模糊搜索文件
		use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
		use("nvim-telescope/telescope-ui-select.nvim")
		use("nvim-telescope/telescope-live-grep-args.nvim")
		use({
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		})
		-- project
		use("ahmedkhalf/project.nvim")
		-- treesitter
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		use("nvim-treesitter/nvim-treesitter-textobjects")
		use("nvim-treesitter/playground")
		--use("nvim-ts-rainbow2")
		-- use("nvim-ts-rainbow")
		use("HiPhish/nvim-ts-rainbow2")
		-- use("ts-rainbow")

		use("RRethy/vim-illuminate")

		use({
			"phaazon/hop.nvim",
			branch = "v2", -- optional but strongly recommended
			config = function()
				-- you can configure Hop the way you like here; see :h hop-config
				require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
			end,
		})
		use("p00f/clangd_extensions.nvim")

		-- Lua
		use({
			"folke/which-key.nvim",
			config = function()
				vim.o.timeout = true
				vim.o.timeoutlen = 300
				require("which-key").setup({
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
				})
			end,
		})

		-- lsp
		use({ "williamboman/mason.nvim" })
		use({ "williamboman/mason-lspconfig.nvim" })
		-- Lspconfig
		use({ "neovim/nvim-lspconfig" })

		-- 补全引擎
		use("hrsh7th/nvim-cmp")
		-- snippet 引擎
		use("hrsh7th/vim-vsnip")
		-- 补全源
		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
		use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
		use("hrsh7th/cmp-path") -- { name = 'path' }
		use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

		-- 常见编程语言代码段
		use("rafamadriz/friendly-snippets")

		use({ "ray-x/lsp_signature.nvim" })

		-- Lua
		use("folke/todo-comments.nvim")
		use("ravenxrz/neovim-cmake")
		-- go
		use("ray-x/go.nvim")
		use("ray-x/guihua.lua") -- recommended if need floating window support

		-- Rust 增强
		use("simrat39/rust-tools.nvim")
		-- JSON 增强
		use("b0o/schemastore.nvim")
		-- Debuging
		use("nvim-lua/plenary.nvim")

		-- dap  Debuging
		use("mfussenegger/nvim-dap")
		--use("theHamsta/nvim-dap-virtual-text")
		--use("rcarriga/nvim-dap-ui")
		-- Comment
		use("numToStr/Comment.nvim")
		-- nvim-autopairs
		use("windwp/nvim-autopairs")

		-- surround
		use({
			"kylechui/nvim-surround",
			tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		})
		-- use("ur4ltz/surround.nvim")
		-- 代码格式化
		-- use("mhartington/formatter.nvim")
		use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
		-- ui
		use("onsails/lspkind-nvim")
		-- indent-blankline
		use("lukas-reineke/indent-blankline.nvim")
		use("tami5/lspsaga.nvim")

		-- markdown
		-- use({ "iamcco/markdown-preview.nvim" })

		-- git
		use({
			"lewis6991/gitsigns.nvim",
			-- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
		})
		use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

		-- float terminal in the  floating/popuup window
		use("voldikss/vim-floaterm")

		-- use("mbledkowski/neuleetcode.vim")
		-- use("Shatur/neovim-session-manager")
		use("folke/persistence.nvim")
		-- ################################# color theme #################################

		-- colorizer
		use({ "norcalli/nvim-colorizer.lua", as = "nvim-colorizer" })
		-- A bunch of colorschemes you can try out
		use("projekt0n/github-nvim-theme")
		use("lunarvim/colorschemes")
		-- tokyonight
		use("folke/tokyonight.nvim")
		-- tokyodark
		use("tiagovla/tokyodark.nvim")
		-- OceanicNext
		use("mhartington/oceanic-next")
		-- gruvbox
		use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
		-- zephyr 暂时不推荐
		-- use("glepnir/zephyr-nvim")
		-- nord
		use("shaunsingh/nord.nvim")
		-- onedark
		use("ful1e5/onedark.nvim")
		-- nightfox
		use("EdenEast/nightfox.nvim")
		use("NLKNguyen/papercolor-theme")
		use("ayu-theme/ayu-vim")
		use({ "catppuccin/nvim", as = "catppuccin" })
		use("sainnhe/everforest")
		-- use("tempus-themes")
		use("sainnhe/edge")
		use({ "rose-pine/neovim", as = "rose-pine" })
	end,
	config = {
		-- 并发数限制
		max_jobs = 16,
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
		-- 自定义源
		git = {
			-- default_url_format = "https://hub.fastgit.xyz/%s",
			-- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
			-- default_url_format = "https://gitcode.net/mirrors/%s",
			-- default_url_format = "https://gitclone.com/github.com/%s",
		},
	},
})
