return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "c", "cpp" })
        vim.list_extend(opts.ensure_installed, { "go", "gomod", "gowork", "gosum" })
        vim.list_extend(opts.ensure_installed, { "ron", "rust", "toml" })
        vim.list_extend(opts.ensure_installed, { "ninja", "python", "rst", "toml" })
        vim.list_extend(opts.ensure_installed, { "java" })
      end
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ensure mason installs the server
        -- tailwindcss = {
        --   filetypes_exclude = { "markdown" },
        -- },
        jsonls = {},
        lua_ls = {
          -- mason = false, -- set to false if you don't want this server to be installed with mason
          -- Use this to add any additional keymaps
          -- for specific lsp servers
          ---@type LazyKeys[]
          -- keys = {},
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
          keys = {
            { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
          },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(
              "Makefile",
              "configure.ac",
              "configure.in",
              "config.h.in",
              "meson.build",
              "meson_options.txt",
              "build.ninja"
            )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
              fname
            ) or require("lspconfig.util").find_git_ancestor(fname)
          end,
          capabilities = {
            offsetEncoding = { "utf-16" },
          },
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          },
        },
        gopls = {
          keys = {
            -- Workaround for the lack of a DAP strategy in neotest-go: https://github.com/nvim-neotest/neotest-go/issues/12
            { "<leader>td", "<cmd>lua require('dap-go').debug_test()<CR>", desc = "Debug Nearest (Go)" },
          },
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                fieldalignment = true,
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
              semanticTokens = true,
            },
          },
        },
        rust_analyzer = {
          keys = {
            { "K", "<cmd>RustHoverActions<cr>", desc = "Hover Actions (Rust)" },
            { "<leader>cR", "<cmd>RustCodeAction<cr>", desc = "Code Action (Rust)" },
            { "<leader>dr", "<cmd>RustDebuggables<cr>", desc = "Run Debuggables (Rust)" },
          },
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
              },
              -- Add clippy lints for Rust.
              checkOnSave = {
                allFeatures = true,
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
              procMacro = {
                enable = true,
                ignored = {
                  ["async-trait"] = { "async_trait" },
                  ["napi-derive"] = { "napi" },
                  ["async-recursion"] = { "async_recursion" },
                },
              },
            },
          },
        },
        taplo = {
          keys = {
            {
              "K",
              function()
                if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
                  require("crates").show_popup()
                else
                  vim.lsp.buf.hover()
                end
              end,
              desc = "Show Crate Documentation",
            },
          },
        },
        pyright = {},
        ruff_lsp = {},
        jdtls = {
          -- stylua: ignore
          keys = {
            { "<leader>co", function() require("jdtls").organize_imports() end, desc = "Organize Imports", },
            { "<leader>cR", function() require("jdtls").rename_file() end, desc = "Rename File", },
            { "<leader>cxv", function() require("jdtls").extract_variable() end, desc = "Extract Variable", },
            { "<leader>cxv", function() require("jdtls").extract_variable({ visual = true }) end, mode = "v", desc = "Extract Variable", },
            { "<leader>cxc", function() require("jdtls").extract_constant() end, desc = "Extract Constant", },
            { "<leader>cxc", function() require("jdtls").extract_constant({ visual = true }) end, mode = "v", desc = "Extract Constant", },
            { "<leader>cxm", function() require("jdtls").extract_method({ visual = true }) end, mode = "v", desc = "Extract Method", },
          },
        },
      },
      setup = {
        -- tailwindcss = function(_, opts)
        --   local tw = require("lspconfig.server_configurations.tailwindcss")
        --   --- @param ft string
        --   opts.filetypes = vim.tbl_filter(function(ft)
        --     return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
        --   end, tw.default_config.filetypes)
        -- end,
        clangd = function(_, opts)
          local clangd_ext_opts = require("lazyvim.util").opts("clangd_extensions.nvim")
          require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
          return false
        end,
        gopls = function(_, opts)
          -- workaround for gopls not supporting semanticTokensProvider
          -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
          require("lazyvim.util").on_attach(function(client, _)
            if client.name == "gopls" then
              if not client.server_capabilities.semanticTokensProvider then
                local semantic = client.config.capabilities.textDocument.semanticTokens
                client.server_capabilities.semanticTokensProvider = {
                  full = true,
                  legend = {
                    tokenTypes = semantic.tokenTypes,
                    tokenModifiers = semantic.tokenModifiers,
                  },
                  range = true,
                }
              end
            end
          end)
          -- end workaround
        end,

        rust_analyzer = function(_, opts)
          local rust_tools_opts = require("lazyvim.util").opts("rust-tools.nvim")
          require("rust-tools").setup(vim.tbl_deep_extend("force", rust_tools_opts or {}, { server = opts }))
          return true
        end,

        ruff_lsp = function()
          require("lazyvim.util").on_attach(function(client, _)
            if client.name == "ruff_lsp" then
              -- Disable hover in favor of Pyright
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
        jdtls = function()
          -- The lspconfig configuration for jdtls contains two useful items:
          -- 1. The list of filetypes on which to match.
          -- 2. Custom method for finding the root for a java project.
          local lsp_config = require("lspconfig.server_configurations.jdtls").default_config
          local find_java_project_root = lsp_config.root_dir
          local filetypes = lsp_config.filetypes
          -- lookup paths for java test and debugger package
          local mason_registry = require("mason-registry")
          local bundles = {}
          if mason_registry.has_package("java-test") and mason_registry.has_package("java-debug-adapter") then
            -- jdtls tools configuration for debugging support
            local java_test_pkg = mason_registry.get_package("java-test")
            local java_test_path = java_test_pkg:get_install_path()
            local java_dbg_pkg = mason_registry.get_package("java-debug-adapter")
            local java_dbg_path = java_dbg_pkg:get_install_path()
            local jar_patterns = {
              java_dbg_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar",
              java_test_path .. "/extension/server/*.jar",
            }
            for _, jar_pattern in ipairs(jar_patterns) do
              for _, bundle in ipairs(vim.split(vim.fn.glob(jar_pattern), "\n")) do
                table.insert(bundles, bundle)
              end
            end
          end
          -- Attach jdtls for the proper filetypes (i.e. java).
          -- Existing server will be reused if the root_dir matches.
          vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("MyJdtls", { clear = true }),
            pattern = filetypes,
            callback = function()
              local fname = vim.api.nvim_buf_get_name(0)
              local root_dir = find_java_project_root(fname)
              local project_name = root_dir and vim.fs.basename(root_dir)
              local cmd = { "jdtls" }
              if project_name then
                local jdtls_cache_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. project_name
                vim.list_extend(cmd, {
                  "-configuration",
                  jdtls_cache_dir .. "/config",
                  "-data",
                  jdtls_cache_dir .. "/workspace",
                })
              end
              local jdtls_base_config = {
                on_attach = require("lazyvim.util").on_attach(function(client, buffer)
                  if mason_registry.has_package("java-test") then
                    -- custom keymaps for Java test runner (not yet compatible with neotest)
                    vim.keymap.set("n", "<leader>tT", function()
                      require("jdtls").pick_test({ bufnr = buffer })
                    end, { buffer = buffer, desc = "Run specific Test" })
                    vim.keymap.set("n", "<leader>tt", function()
                      require("jdtls").test_class({ bufnr = buffer })
                    end, { buffer = buffer, desc = "Run File" })
                    vim.keymap.set("n", "<leader>tr", function()
                      require("jdtls").test_nearest_method({ bufnr = buffer })
                    end, { buffer = buffer, desc = "Run nearest" })
                  end
                  if mason_registry.has_package("java-debug-adapter") then
                    -- custom init for Java debugger
                    require("jdtls").setup_dap({ hotcodereplace = "auto" })
                    require("jdtls.dap").setup_dap_main_class_configs()
                  end
                  require("jdtls.setup").add_commands()
                end),
                cmd = cmd,
                root_dir = root_dir,
                init_options = {
                  bundles = bundles,
                },
              }
              local jdtls_opts = require("lazyvim.util").opts("nvim-jdtls")
              require("jdtls").start_or_attach(vim.tbl_deep_extend("force", jdtls_opts or {}, jdtls_base_config))
              require("which-key").register({ c = { x = { name = "Extract" } } }, { prefix = "<leader>" })
            end,
          })
          return true -- avoid duplicate servers
        end,
      },
    },
  },
}
