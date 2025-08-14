return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = true,
			color_overrides = {
				mocha = {
					border = "#b4befe",
				},
			},
			integrations = {
				cmp = true,
				telescope = { enabled = true },
				treesitter = true,
				noice = true,
				which_key = true,
			},
		})

		vim.cmd("colorscheme catppuccin")
	end,
}
