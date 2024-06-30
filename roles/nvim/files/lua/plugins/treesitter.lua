return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" }, -- lazy load when entering new or opened buffers
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			-- syntax highlighting
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			-- indenting
			indent = {
				enable = true,
			},
			-- autotagging
			autotag = {
				enable = true,
			},
			ensure_installed = {
				"vim",
				"vimdoc",
				"bash",
				"comment",
				"css",
				"csv",
				"dockerfile",
				"gitignore",
				"gpg",
				"graphql",
				"html",
				"http",
				"hcl",
				"java",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"prisma",
				"properties",
				"python",
				"regex",
				"rust",
				"sql",
				"svelte",
				"ssh_config",
				"terraform",
				"toml",
				"tsx",
				"typescript",
				"xml",
				"yaml",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
		vim.filetype.add({
			pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
		})
	end,
}
