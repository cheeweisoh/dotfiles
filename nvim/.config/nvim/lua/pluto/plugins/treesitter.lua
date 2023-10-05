return {
	"nvim-treesitter/nvim-treesitter",
	config = function ()
		local treesitter = require("nvim-treesitter")

		treesitter.setup({
			ensure_installed = { "lua", "vim" }
		})
	end,
}
