return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
            build = ":TSUpdate",
            indent = {
                enable = true,
            },
            autotag = {
                enable = true,
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
                "regex"
            },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = true,
            },
		})
	end,
}
