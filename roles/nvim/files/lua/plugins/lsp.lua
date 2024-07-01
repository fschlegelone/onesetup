return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false,
		init = function()
			-- Disable automatic setup to benefit from lazy loading
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},

	-- Mason for managing LSP servers, DAP servers, linters, and formatters
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},

	-- Autocompletion setup with nvim-cmp and LuaSnip
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "L3MON4D3/LuaSnip" },
			{ "onsails/lspkind.nvim" },
		},
		config = function()
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_cmp()
			local cmp = require("cmp")
			local cmp_action = lsp_zero.cmp_action()
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			cmp.setup({
				formatting = {
					fields = { "abbr", "kind", "menu" },
					format = lspkind.cmp_format({
						mode = "symbol", -- show only symbol annotations
						maxwidth = 50, -- prevent the popup from showing more than provided characters
						ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
					}),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-f>"] = cmp_action.luasnip_jump_forward(),
					["<C-b>"] = cmp_action.luasnip_jump_backward(),
				}),
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
			})
		end,
	},

	-- LSP Configuration with lsp-zero and lspconfig
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			local lsp_zero = require("lsp-zero")
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")

			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)

			lsp_zero.set_server_config({
				capabilities = {
					textDocument = {
						foldingRange = {
							dynamicRegistration = false,
							lineFoldingOnly = true,
						},
					},
				},
			})

			mason_lspconfig.setup({
				ensure_installed = {
					"terraformls", -- terraform
					"tflint", -- terraform
					"lua_ls", -- lua
					"ansiblels", -- ansible
					"bashls", -- bash
					"cssls", -- css
					"css_variables", -- css
					"diagnosticls",
					"docker_compose_language_service", -- container
					"dockerls", -- container
					"eslint",
					"gitlab_ci_ls",
					"graphql",
					"html",
					"htmx",
					"java_language_server",
					"jsonls",
					"marksman", -- markdown
					"powershell_es",
					"prismals",
					"ruff", -- python
					"ruff_lsp", -- python
					"rust_analyzer",
					"sqlls",
					"svelte",
					"tailwindcss",
					"tsserver",
					"vimls",
					"yamlls",
					"angularls",
					"awk_ls",
					"harper_ls", -- language checker
					"relay_lsp", -- react
					"stylelint_lsp",
					"tabby_ml", -- self hosted AI assistant
					"tblgen_lsp_server", -- llvm
					"templ", -- templ html templating
					"texlab", -- LaTeX
					"textlsp", -- AI text checker
					"vacuum", -- OpenAPI & Swagger Linting
					"vtsls", -- typescript
					"zls", -- zig
					"biome", -- fast formatter
					"dprint", -- formatter written in rust
					"ruby_lsp", -- ruby
					"autotools_ls", -- automake, autoconf, libtool, ..
					"azure_pipelines_ls", -- azure pipelines
					"clangd", -- c, c++
				},
				handlers = {
					function(server_name)
						lspconfig[server_name].setup({
							capabilities = lsp_zero.capabilities,
						})
					end,

					-- Custom handlers
					["lua_ls"] = function()
						local lua_opts = lsp_zero.nvim_lua_ls()
						lspconfig["lua_ls"].setup(lua_opts)
					end,

					["terraformls"] = function()
						lspconfig["terraformls"].setup({
							capabilities = lsp_zero.capabilities,
							init_options = {
								cmd = {
									"terraform-ls",
								},
								filetypes = {
									"hcl",
									"terraform",
									"terraform-vars",
								},
							},
						})
					end,
					["ansiblels"] = function()
						lspconfig["ansiblels"].setup({
							capabilities = lsp_zero.capabilities,
							cmd = {
								"ansible-language-server",
								"--stdio",
							},
							filetypes = {
								"yml",
								"yaml",
								"ansible",
							},
							settings = {
								ansible = {
									ansible = {
										path = "ansible",
									},
									ansibleLint = {
										path = "ansible-lint",
									},
								},
							},
						})
					end,
				},
			})
		end,
	},

	-- Optional: null-ls for additional formatting and linting
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.diagnostics.eslint,
					null_ls.builtins.code_actions.gitsigns,
				},
			})
		end,
	},
}
