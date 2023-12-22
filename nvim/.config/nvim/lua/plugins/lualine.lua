return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = function()
       	require("lualine").setup({
		options = {
			theme = "nord",
			globalstatus = true,
			component_separators = "",
			section_separators = "",
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "filename" },
            lualine_c = {},
			lualine_x = { "diagnostics" },
			lualine_y = { "encoding", "filetype" },
			lualine_z = { "branch" },
		},
	})
    end,
}
