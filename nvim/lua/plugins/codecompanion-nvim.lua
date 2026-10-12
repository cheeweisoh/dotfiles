return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	lazy = false,
	config = function()
		require("codecompanion").setup({
			display = {
				chat = {
					window = {
						position = "right", -- left|right|top|bottom (nil will default depending on vim.opt.splitright|vim.opt.splitbelow)
						width = 0.3,
					},
				},
			},
			adapters = {
				acp = {
					gemini_cli = function()
						return require("codecompanion.adapters").extend("gemini_cli", {
							defaults = {
								auth_method = "oauth-personal", -- "oauth-personal"|"gemini-api-key"|"vertex-ai"
							},
						})
					end,
				},
			},
			strategies = {
				chat = {
					adapter = "gemini_cli",
					opts = {
						placement = "vertical rightbelow",
					},
				},
			},
		})
	end,
}
