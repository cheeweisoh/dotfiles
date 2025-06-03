return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	config = function()
		require("nvim-tree").setup({
			filters = {
				dotfiles = false,
			},
			view = {
				adaptive_size = true,
			},
			git = {
				enable = true,
				ignore = false,
			},
		})
	end,
}
