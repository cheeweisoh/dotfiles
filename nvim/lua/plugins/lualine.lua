return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin",
				globalstatus = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{ "mode" },
				},
				lualine_b = {
					{ "filename", color = { bg = "none" } },
				},
				lualine_c = {},
				lualine_x = {
					{ "diagnostics", color = { bg = "#1e1e2e" } },
				},
				lualine_y = {
					{ "encoding", color = { bg = "#1e1e2e" } },
					{
						function()
							return "│"
						end,
						color = { fg = "#6c7086", bg = "none" },
						padding = 0,
					},
					{ "filetype", color = { bg = "#1e1e2e" } },
				},
				lualine_z = {
					{
						function()
							return "│"
						end,
						color = { fg = "#6c7086", bg = "none" },
						padding = 0,
					},
					{ "branch", color = { bg = "#1e1e2e", fg = "#89b4fa" } },
				},
			},
		})
	end,
}
