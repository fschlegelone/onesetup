return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
		"nvim-lua/plenary.nvim",
		"nvim-lua/popup.nvim",
		"nvim-tree/nvim-web-devicons",
		"BurntSushi/ripgrep",
		"MunifTanjim/nui.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{
			"jvgrootveld/telescope-zoxide",
		},
		{
			"cappyzawa/telescope-terraform.nvim",
			config = function()
				require("telescope").load_extension("terraform")
			end,
		},
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")
		local themes = require("telescope.themes")
		local z_utils = require("telescope._extensions.zoxide.utils")
		telescope.setup({
			defaults = {
				path_display = { "smart" },
				-- KEYMAPs (inside of telescope windows)
				mappings = {
					i = {},
					n = {
						["q"] = actions.close,
						["<C-d>"] = actions.delete_buffer + actions.move_to_top, -- delete(close) selected buffer
					},
				},
			},
			-- # EXTENSIONS # --
			extensions = {
				-- fzf
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				-- zoxide
				zoxide = {
					prompt_title = "Zoxide",
				},
				-- ui-select
				["ui-select"] = {
					themes.get_dropdown({}),
				},
			},
		}) -- setup: end

		-- load extensions
		telescope.load_extension("fzf") -- load fzf extension
		telescope.load_extension("ui-select") -- load ui-select extension
		telescope.load_extension("zoxide") -- load zoxide extension
		-- # KEYMAPS # --
		-- telescope
		KEYMAP("n", "<leader>ff", builtin.find_files, { desc = "Telescope: Fuzzy find files in cwd" })
		KEYMAP("n", "<leader>fg", builtin.live_grep, { desc = "Telescope: Find string in cwd" })
		KEYMAP("n", "<leader>fb", builtin.buffers, { desc = "Telescope: Find buffers" })
		KEYMAP("n", "<leader>fh", builtin.help_tags, { desc = "Telescope: Find help tags" })
		KEYMAP("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Telescope: Fuzzy find recent files" })
		KEYMAP(
			"n",
			"<leader>fc",
			"<cmd>Telescope grep_string<cr>",
			{ desc = "Telescope: Find string under cursor in cwd" }
		)
		-- zoxide extension
		KEYMAP("n", "<leader>fz", telescope.extensions.zoxide.list, { desc = "Zoxide: list recent directories" })
	end,
}
