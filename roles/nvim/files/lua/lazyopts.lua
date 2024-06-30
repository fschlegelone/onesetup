-- /lua/lazyopts.lua
local M = {}

M.opts = {
	root = vim.fn.stdpath("data") .. "/lazy", -- plugin installation directory
	defaults = {
		lazy = false,
	},
	local_spec = true, -- load project specific .lazy.lua spec files. They will be added at the end of the spec.
	lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
	dev = {
		path = "~/github/myrepos/onevim/plugins", -- directory for custom neovim plugins
		patterns = { "one" }, -- plugins matching these patterns use local directory instead of github repo
	},
	install = {
		missing = true,
		auto = true,
	},
	update = {
		enabled = true,
		on_start = true,
	},
	ui = {
		size = {
			width = 0.6,
			height = 0.6,
		},
		border = "none",
		backdrop = 100,
	},
	checker = {
		enabled = true,
		notify = true,
		frequency = 86400, -- Check daily
		check_pinned = true,
	},
	change_detection = {
		enabled = true,
		notify = true,
	},
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true,
		rtp = {
			reset = true, -- reset runtime path to $VIMRUNTIME
			paths = {}, -- list of paths to add to runtime path
			disabled_plugins = {},
		},
		readme = {
			enabled = true,
			root = vim.fn.stdpath("state") .. "/lazy/readme",
			files = { "README.md", "lua/**/README.md" },
			skip_if_doc_exists = false, -- generate markdown helptags for plugins with docs
		},
		state = vim.fn.stdpath("state") .. "/lazy/state.json",
		build = {
			warn_on_override = true, -- warn if a plugin has both a build.lua and a build key
		},
		profiling = {
			loader = true, -- profile plugin loading times
			require = true, -- track each new require in the lazy profiling tab
		},
	},
	-- custom keymaps
	custom_keys = {
		["<leader>l"] = {
			function(plugin)
				require("lazy.util").float_term({ "lazygit", "log" }, {
					cwd = plugin.dir,
				})
			end,
			desc = "Open lazygit log",
		},
	},
}

return M
