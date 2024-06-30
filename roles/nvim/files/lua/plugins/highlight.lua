return {
	-- PLUGIN: vim-illuminate
	{
		"RRethy/vim-illuminate", -- highlight related keywords under the cursor
		event = { "BufReadPre", "BufNewFile" }, -- event for lazy loading
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			local illuminate = require("illuminate")
			illuminate.configure({
				providers = {
					"treesitter",
					"lsp",
				},
				under_cursor = true,
				min_count_to_highlight = 1,
			})
		end,
	},
	-- PLUGIN: yanky --
	{
		"gbprod/yanky.nvim",
		event = { "BufReadPre", "BufNewFile" }, -- event for lazy loading
		dependencies = {
			{ "kkharji/sqlite.lua" },
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("yanky").setup({

				ring = {
					history_length = 100,
					storage = "sqlite",
					sync_with_numbered_registers = true,
					cancel_event = "update",
				},
				system_clipboard = {
					sync_with_ring = true,
					clipboard_register = nil, -- use system clipboard register
				},
				highlight = {
					on_put = true,
					on_yank = true,
					timer = 200,
				},
				preserve_cursor_position = {
					enabled = true,
				},
				textobj = {
					enabled = true,
				},
				-- KEYMAPS --
				KEYMAP({ "n", "x" }, "p", "<Plug>(YankyPutAfter)"),
				KEYMAP({ "n", "x" }, "P", "<Plug>(YankyPutBefore)"),
				KEYMAP({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)"),
				KEYMAP({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)"),
				KEYMAP("n", "<c-p>", "<Plug>(YankyPreviousEntry)"),
				KEYMAP("n", "<c-n>", "<Plug>(YankyNextEntry)"),
				KEYMAP("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)"),
				KEYMAP("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)"),
				KEYMAP("n", "]P", "<Plug>(YankyPutIndentAfterLinewise)"),
				KEYMAP("n", "[P", "<Plug>(YankyPutIndentBeforeLinewise)"),
				KEYMAP("n", ">p", "<Plug>(YankyPutIndentAfterShiftRight)"),
				KEYMAP("n", "<p", "<Plug>(YankyPutIndentAfterShiftLeft)"),
				KEYMAP("n", ">P", "<Plug>(YankyPutIndentBeforeShiftRight)"),
				KEYMAP("n", "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)"),
				KEYMAP("n", "=p", "<Plug>(YankyPutAfterFilter)"),
				KEYMAP("n", "=P", "<Plug>(YankyPutBeforeFilter)"),
				KEYMAP("n", "<c-p>", "<Plug>(YankyPreviousEntry)"),
				KEYMAP("n", "<c-n>", "<Plug>(YankyNextEntry)"),
			})
		end,
	},
}
