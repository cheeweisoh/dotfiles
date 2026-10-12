return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			indent = {
				enable = true,
				disable = { "typescript", "tsx" },
			},
			ensure_installed = {
				"markdown",
				"markdown_inline",
				"json",
				"java",
				"bash",
				"lua",
				"vim",
				"gitignore",
				"python",
				"sql",
				"regex",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = true,
			},
		})
	end,
}
