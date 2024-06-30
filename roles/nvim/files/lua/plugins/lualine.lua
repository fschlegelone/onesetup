return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local lualine = require("lualine")

		-- CUSTOM COLORS: catppuccin
		local onetheme = {
			normal = {
				-- left
				a = { bg = COLORS.MAUVE, fg = COLORS.BASE, gui = "bold" },
				b = { bg = COLORS.SURFACE0, fg = COLORS.MAUVE },
				c = { fg = COLORS.MAUVE },
				-- right
				x = { fg = COLORS.MAUVE },
				y = { bg = COLORS.SURFACE0, fg = COLORS.MAUVE },
				z = { bg = COLORS.MAUVE, fg = COLORS.BASE, gui = "bold" },
			},
			insert = {
				-- left
				a = { bg = COLORS.TEAL, fg = COLORS.BASE, gui = "bold" },
				b = { bg = COLORS.SURFACE0, fg = COLORS.TEAL },
				c = { fg = COLORS.TEAL },
				-- right
				x = { fg = COLORS.MAUVE },
				y = { bg = COLORS.SURFACE0, fg = COLORS.MAUVE },
				z = { bg = COLORS.MAUVE, fg = COLORS.BASE, gui = "bold" },
			},
			visual = {
				-- left
				a = { bg = COLORS.GREEN, fg = COLORS.BASE, gui = "bold" },
				b = { bg = COLORS.SURFACE0, fg = COLORS.GREEN },
				c = { fg = COLORS.GREEN },
				-- right
				x = { fg = COLORS.MAUVE },
				y = { bg = COLORS.SURFACE0, fg = COLORS.MAUVE },
				z = { bg = COLORS.MAUVE, fg = COLORS.BASE, gui = "bold" },
			},
			command = {
				-- left
				a = { bg = COLORS.PINK, fg = COLORS.BASE, gui = "bold" },
				b = { bg = COLORS.SURFACE0, fg = COLORS.PINK },
				c = { fg = COLORS.PINK },
				-- right
				x = { fg = COLORS.MAUVE },
				y = { bg = COLORS.SURFACE0, fg = COLORS.MAUVE },
				z = { bg = COLORS.MAUVE, fg = COLORS.BASE, gui = "bold" },
			},
			replace = {
				-- left
				a = { bg = COLORS.RED, fg = COLORS.BASE, gui = "bold" },
				b = { bg = COLORS.SURFACE0, fg = COLORS.RED },
				c = { fg = COLORS.RED },
				-- right
				x = { fg = COLORS.MAUVE },
				y = { bg = COLORS.SURFACE0, fg = COLORS.MAUVE },
				z = { bg = COLORS.MAUVE, fg = COLORS.BASE, gui = "bold" },
			},
		}

		-- CUSTOM FUNCTION: get active LSP clients
		local function get_lsp_clients()
			local buf_clients = vim.lsp.get_clients()
			if next(buf_clients) == nil then
				return ""
			end

			local client_names = {}
			for _, client in pairs(buf_clients) do
				if client.name ~= "GitHub Copilot" then
					table.insert(client_names, client.name)
				end
			end
			return table.concat(client_names, ", ")
		end

		local function icon_ft()
			local devicons = require("nvim-web-devicons")
			local icon, _ = devicons.get_icon(vim.fn.expand("%:t"), vim.fn.expand("%:e"))
			return icon
		end

		lualine.setup({
			options = {
				theme = onetheme,
				ignore_focus = {
					"neo-tree",
				},
				section_separators = {
					left = "",
					right = "",
				},
				component_separators = {
					left = "",
					right = "",
				},
			},
			sections = {
				-- left
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = { "diagnostics" },
				-- right
				lualine_x = {
					{
						get_lsp_clients,
					},
					{
						icon_ft,
					},
				},
				lualine_y = {
					"filename",
				},
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
